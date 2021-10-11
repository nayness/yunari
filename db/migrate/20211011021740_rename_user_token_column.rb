class RenameUserTokenColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :characters, :user_token, :token
  end
end
