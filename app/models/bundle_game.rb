# Запись о том как пользователь сыграл этот пакет (игру)
#
class BundleGame < ApplicationRecord
  include JustCreated
  include Workflow

  belongs_to :bundle
  belongs_to :user

  has_many :slides, through: :bundle
  has_many :slide_games, -> { ordered }

  scope :ordered, -> { order :id }

  workflow_column :state
  workflow do
    state :draft do
      event :done, transitions_to: :done
    end
    state :done
  end

  after_create :create_slide_games

  def next_slide_game
    slide_games.with_draft_state.first
  end

  def slides_count
    slide_games.count
  end

  def done_slides_count
    slide_games.with_done_state.count
  end

  def progress_percents
    done_slides_count * 100 / slides_count
  end

  def progress_humanized
    "#{done_slides_count} из #{slides_count}"
  end

  private

  def create_slide_games
    slides.ordered.each do |slide|
      slide_games.
        create_with(user_id: user_id, state: :draft).
        find_or_create_by! slide: slide, bundle_game: self
    end
  end
end
