class Character < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :race
  belongs_to :kind

  has_one_attached :image

  scope :for_public, -> { where(privacy: false) }

  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true
  validates :token, presence: true, uniqueness: true
  validates :power, inclusion: { in: 100..1000 }
  validates :attack, inclusion: { in: 100..1000 }
  validates :strenght, inclusion: { in: 100..1000 }
  validates :charisma, inclusion: { in: 100..1000 }
  validates :spirit, inclusion: { in: 100..1000 }
  validates :image, attached: true
  validate :total?

  before_validation :generate_token
  before_save :sanitize_name
  before_save :slugify

  def slugify
    clean_name = standard_name
    self.slug = I18n.transliterate(clean_name.gsub(/\s/, '-'))
  end

  def sanitize_name
    self.name = standard_name
  end

  def standard_name
    name.downcase.strip.gsub(/[^0-9A-Za-z\s]/, '')
  end

  def total?
    total_points == 2500
  end

  def remaining_points
    2500 - total_points
  end

  def total_points
    power + attack + spirit + charisma + strenght
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Character.exists?(token: random_token)
    end
  end
end
