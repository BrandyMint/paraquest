class Private::SlideGamesController < Private::ApplicationController
  def show
    if slide_game.done?
      render :done, locals: { slide_game: slide_game }
    else
      render :play, locals: { slide_game: slide_game }
    end
  end

  def done
    slide_game.assign_attributes permitted_params
    slide_game.done!

    bundle_game = slide_game.bundle_game

    if bundle_game.done?
      flash.notice = 'Квест пройден'
      redirect_to private_bundle_game_path(bundle_game)
    else
      redirect_to private_slide_game_path(bundle_game.next_slide_game), notice: 'Принятно, следующий'
    end

  rescue ActiveRecord::RecordInvalid => e
    Bugsnag.notify e
    flash.now.alert = e.message
    render :play, locals: { slide_game: e.record }
  end

  private

  def slide_game
    @slide_game ||= current_user.slide_games.find params[:id]
  end

  def permitted_params
    params.require(:slide_game).permit(:click_top, :click_left, :current_slide_width, :current_slide_height)
  end
end
