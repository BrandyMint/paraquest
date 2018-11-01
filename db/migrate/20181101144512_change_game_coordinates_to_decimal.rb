class ChangeGameCoordinatesToDecimal < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :coordinate_x, :x
    rename_column :games, :coordinate_y, :y

    change_column :games, :x, :decimal
    change_column :games, :y, :decimal
  end
end
