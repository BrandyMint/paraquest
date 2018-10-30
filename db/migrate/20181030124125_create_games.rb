class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :user, foreign_key: true, null: false
      t.references :slide, foreign_key: true, null: false
      t.integer :coordinate_x, null: false
      t.integer :coordinate_y, null: false

      t.timestamps
    end
  end
end
