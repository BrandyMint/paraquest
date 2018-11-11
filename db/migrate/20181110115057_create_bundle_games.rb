class CreateBundleGames < ActiveRecord::Migration[5.2]
  def change
    create_table :bundle_games do |t|
      t.references :bundle, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :state, null: false

      t.timestamps
    end

    add_index :bundle_games, [:bundle_id, :user_id], unique: true
  end
end
