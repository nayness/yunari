class Kind < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :characters, dependent: :nullify
end
