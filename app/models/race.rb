class Race < ApplicationRecord
  has_many :characters, dependent: :nullify
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
