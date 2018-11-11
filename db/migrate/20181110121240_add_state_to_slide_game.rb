class AddStateToSlideGame < ActiveRecord::Migration[5.2]
  class BundleGame < ApplicationRecord
  end
  def change
    add_column :slide_games, :state, :string
    add_reference :slide_games, :bundle_game
    add_index :slide_games, [:bundle_game_id, :slide_id], unique: true

    remove_index :slide_games, name: :index_slide_games_on_slide_id_and_user_id

    SlideGame.find_each do |slide_game|
      slide_game.update! bundle_game_id: find_or_create_bundle(slide_game).id
    end
    ::BundleGame.find_each { |b| b.send :create_slide_games }

    change_column_null :slide_games, :bundle_game_id, false
    change_column_null :bundle_games, :state, false

    execute "update slide_games set state='done'"
    change_column_null :slide_games, :state, false
  end

  private

  def find_or_create_bundle(slide_game)
    bundle = slide_game.slide.bundle

    bundle_game = BundleGame.find_by(user_id: slide_game.user_id, bundle_id: bundle.id)
    return bundle_game if bundle_game.present?

    bundle_game = BundleGame.new state: :done, user_id: slide_game.user_id, bundle_id: bundle.id

    # BundleGame.skip_callback(:create, :after, :create_slide_games)

    bundle_game.save!

    bundle_game
  end
end
