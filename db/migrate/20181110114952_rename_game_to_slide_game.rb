class RenameGameToSlideGame < ActiveRecord::Migration[5.2]
  def change
    rename_table :games, :slide_games
  end
end
