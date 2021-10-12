class AddPrivacyToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :privacy, :boolean, default: false
  end
end
