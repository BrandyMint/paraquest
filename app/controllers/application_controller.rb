class ApplicationController < ActionController::Base
  include Pagination
  rescue_from ActionController::InvalidAuthenticityToken, with: :rescue_invalid_authenticity_token

  private

  def rescue_invalid_authenticity_token
    render 'user_sessions/new', locals: {
      user_session: UserSession.new,
      message:  'Просрочен токен аутентификации, авторизуйтесь снова',
    }, layout: 'simple'
  end

  def t_flash(key, options = {})
    I18n.t key, options.merge(scope: [:flashes])
  end

  def not_authenticated
    redirect_to login_path, alert: t_flash(:not_authenticated)
  end
end
