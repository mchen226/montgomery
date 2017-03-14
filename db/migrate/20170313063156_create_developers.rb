class CreateDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :developers do |t|
      t.string :name
      t.timestamps
    end

    change_table :games do |t|
      t.references :developer, foreign_key: true
    end

    add_index :games, :title
    add_index :games, [:developer_id, :name], :unique => true
  end
end
