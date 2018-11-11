class BundleGame < ApplicationRecord
  include JustCreated
  include Workflow

  belongs_to :bundle
  belongs_to :user

  has_many :slides, through: :bundle
  has_many :slide_games

  workflow_column :state
  workflow do
    state :process
    state :done
  end

  after_create :create_slide_games

  def next_slide_game
  end

  private

  def create_slide_games
    slides.ordered.each do |slide|
      slide_games.
        create_with(user_id: user_id).
        find_or_create_by! slide: slide, bundle_game: self
    end
  end
end
