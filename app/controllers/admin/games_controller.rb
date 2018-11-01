class Admin::GamesController < Admin::ApplicationController
  def index
    render locals: { games: paginate(Game.order('id desc')) }
  end
end
