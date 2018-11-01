class RenameTitleToDetailsInSlides < ActiveRecord::Migration[5.2]
  def change
    rename_column :slides, :title, :details
    change_column :slides, :details, :text
  end
end
