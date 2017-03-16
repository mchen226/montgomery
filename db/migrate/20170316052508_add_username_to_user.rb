class AddUsernameToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true

    change_column :games, :description, :text
  end

  def down
    remove_column :users, :username
    change_column :games, :description, :string
  end
end
