class AddWidthAndHeightToSlides < ActiveRecord::Migration[5.2]
  def change
    add_column :slides, :width, :integer
    add_column :slides, :height, :integer

    Slide.reset_column_information
    Slide.find_each(&:update_geometry!)

    change_column_null :slides, :width, false
    change_column_null :slides, :height, false
  end
end
