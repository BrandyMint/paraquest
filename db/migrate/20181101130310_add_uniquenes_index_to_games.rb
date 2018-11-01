class AddUniquenesIndexToGames < ActiveRecord::Migration[5.2]
  def change
    execute 'delete from games'

    add_index :games, [:slide_id, :user_id], unique: true
  end
end
