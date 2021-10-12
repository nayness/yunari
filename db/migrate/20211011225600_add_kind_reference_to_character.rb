class AddKindReferenceToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_reference :characters, :kind, null: false, foreign_key: true
  end
end
