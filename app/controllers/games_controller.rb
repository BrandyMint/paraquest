class GamesController < ApplicationController
  before_action :require_login

  def new
    game = Game.new(permitted_params)
    if current_user.played_slide? game.slide
      redirect_to slide_path(game.slide), alert: 'Уже прошли тестирование'
    else
      render locals: { game: game }
    end
  end

  def create
    game = current_user.games.create! permitted_params
    redirect_to slide_path(game.slide_id), notice: 'Отметка учтена'
  rescue ActiveRecord::RecordInvalid => e
    Bugsnag.notify e
    flash.now.alert = e.message
    render :new, locals: { game: e.record }
  end

  private

  def permitted_params
    params.require(:game).permit(:slide_id, :click_top, :click_left, :current_slide_width, :current_slide_height)
  end
end
