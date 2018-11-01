class Admin::GamesController < Admin::ApplicationController
  def index
    render locals: { games: paginate(Game.order('id desc')) }
  end

  def destroy
    game = Game.find params[:id]
    game.destroy!

    redirect_back_or_to slide_path(game.slide_id)
  end
end
