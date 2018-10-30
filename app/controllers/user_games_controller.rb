class UserGamesController < ApplicationController
  before_action :require_login

  def index
    render locals: { games: current_user.games.order('id desc') }
  end
end
