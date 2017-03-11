class AddGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :description
      t.date :release_date
      t.float :score

      t.timestamps
    end
  end
end
