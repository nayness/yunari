class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :characters, dependent: :destroy

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:standard) if self.roles.blank?
  end

  def owns?(character_user_id)
    character_user_id.present? && character_user_id.eql?(id)
  end
end
