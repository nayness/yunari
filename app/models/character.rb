class Character < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :race
  belongs_to :kind

  has_one_attached :image

  validates :name, presence: true
  validates :token, presence: true, uniqueness: true
  validates :power, inclusion: { in: 100..1000 }
  validates :attack, inclusion: { in: 100..1000 }
  validates :strenght, inclusion: { in: 100..1000 }
  validates :charisma, inclusion: { in: 100..1000 }
  validates :spirit, inclusion: { in: 100..1000 }
  validates :image, attached: true

  before_validation :generate_token

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Character.exists?(token: random_token)
    end
  end
end
