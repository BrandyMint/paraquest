class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true, null: false
      t.monetize :in_amount, null: false
      t.monetize :out_amount, null: false
      t.timestamp :archived_at
      t.text :details

      t.timestamps
    end
  end
end
