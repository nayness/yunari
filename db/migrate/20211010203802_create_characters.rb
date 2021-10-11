class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :power, default: 100
      t.integer :attack, default: 100
      t.integer :strenght, default: 100
      t.integer :charisma, default: 100
      t.integer :spirit, default: 100
      t.string :special_skill
      t.string :user_token, null: false

      t.timestamps
    end

    add_index :characters, :user_token
  end
end
