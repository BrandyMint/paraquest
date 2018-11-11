class Private::BundleGamesController < Private::ApplicationController
  def new
    bundle = Bundle.find params[:bundle_id]

    bundle_game = current_user.bundle_games.find_or_create_by!(bundle: bundle)

    flash.notice = 'Квест начался' if bundle_game.is_just_created

    redirect_to
  end

  def index
    render locals: { games: current_user.games.order('id desc') }
  end
end
