class Private::BundleGamesController < Private::ApplicationController
  def new
    bundle = Bundle.find params[:bundle_id]

    bundle_game = current_user.bundle_games.find_or_create_by!(bundle: bundle)

    if bundle_game.is_just_created
      flash.notice = 'Квест начался'
    else

      if bundle_game.done?
        flash.notice = 'Квест уже пройден'
        redirect_to private_bundle_game_path(bundle_game)
        return
      else
        flash.notice = 'Продолжаем..'
      end
    end

    redirect_to private_slide_games_path(bundle_game.next_slide_game)
  end

  def show
    bundle_game = BundleGame.find params[:id]
    render locals: { bundle_game: bundle_game }
  end

  def index
    render locals: { bundle_games: current_user.bundle_games.ordered }
  end
end
