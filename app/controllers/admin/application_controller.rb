class Admin::ApplicationController < ApplicationController
  before_action :require_login
  before_action :require_admin

  private

  def require_admin
    return if current_user.admin?
    flash.alert = 'Доступ только для админов'
    render 'user_sessions/new', locals: { user_session: UserSession.new }, layout: 'simple'
  end
end
