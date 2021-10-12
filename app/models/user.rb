class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :characters

  def owns?(character_user_id)
    character_user_id.present? && character_user_id.eql?(id)
  end
end
