class ApplicationController < ActionController::Base
  include Pagination

  private

  def t_flash(key, options = {})
    I18n.t key, options.merge(scope: [:flashes])
  end

  def not_authenticated
    redirect_to login_path, alert: t_flash(:not_authenticated)
  end
end
