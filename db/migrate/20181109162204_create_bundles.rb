class CreateBundles < ActiveRecord::Migration[5.2]
  def up
    create_table :bundles do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false

      t.timestamps
    end

    add_index :bundles, [:user_id, :title], unique: true

    add_reference :slides, :bundle

    migrate_slides Rails.env.production? ? :shalnov : :dapi

    change_column_null :slides, :bundle_id, false
  end

  private

  def migrate_slides nick
    user = User.find_by_nick nick

    bundle = user.bundles.create! title: 'Пробный пакет'

    Slide.update_all bundle_id: bundle.id
  end
end
