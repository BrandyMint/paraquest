class AddStateToBundle < ActiveRecord::Migration[5.2]
  def change
    add_column :bundles, :state, :string, null: false, default: :draft

    execute "update bundles set state='published'"
  end
end
