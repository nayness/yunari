class AddHistoryToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :history, :text
  end
end
