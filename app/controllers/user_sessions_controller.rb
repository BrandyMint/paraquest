class UserSessionsController < ApplicationController
  layout 'simple'

  def new
    render :new, locals: { user_session: user_session }
  end

  def create
    login(user_session.login, user_session.password, user_session.remember_me) do |user, failure|
      case failure
      when :invalid_login
        flash.now.alert = 'Wrong login provided.'
        render :new, locals: { user_session: user_session }
      when :invalid_password
        flash.now.alert = 'Wrong password provided.'
        render :new, locals: { user_session: user_session }
      when :inactive
        flash.now.alert = 'Your have not yet activated your account.'
        render :new, locals: { user_session: user_session }
      else
        redirect_back_or_to root_path, notice: t_flash(:welcome)
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, alert: t_flash(:goodbye)
  end

  private

  def user_session
    @user_session ||= UserSession.new params.fetch(:user_session, {}).permit(:login, :password, :remember_me)
  end
end
