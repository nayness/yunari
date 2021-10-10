class Character < ApplicationRecord
  validates :name, presence: true
  validates :user_token, presence: true, uniqueness: true
  validates :power, inclusion: { in: [100, 1000] }
  validates :attack, inclusion: { in: [100, 1000] }
  validates :strenght, inclusion: { in: [100, 1000] }
  validates :charisma, inclusion: { in: [100, 1000] }
  validates :spirit, inclusion: { in: [100, 1000] }
end
