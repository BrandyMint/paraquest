class GamesController < ApplicationController
  before_action :require_login

  def new
    render locals: { game: Game.new(permitted_params) }
  end

  def create
    game = current_user.games.create! permitted_params
    redirect_to slide_path(game.slide_id), notice: 'Отметка учтена'
  end

  private

  def permitted_params
    params.require(:game).permit(:slide_id, :click_top, :click_left, :current_slide_width, :current_slide_height)
  end
end
