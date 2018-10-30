class GamesController < ApplicationController
  before_action :require_login

  def new
    render locals: { game: Game.new(permitted_params) }
  end

  def create
    current_user.games.create! permitted_params
    redirect_to user_games_path, notice: 'Отметка учтена'
  end

  private

  def permitted_params
    params.require(:game).permit(:slide_id, :coordinate_x, :coordinate_y)
  end
end
