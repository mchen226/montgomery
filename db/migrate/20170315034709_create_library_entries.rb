class CreateLibraryEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :library_entries do |t|
      t.integer :status, default: 1
      t.integer :score
      t.integer :game_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :library_entries, [:user_id, :game_id], unique: true
  end
end
