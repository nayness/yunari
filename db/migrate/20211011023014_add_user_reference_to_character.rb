class AddUserReferenceToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_reference :characters, :user, foreign_key: true
  end
end
