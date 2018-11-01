class UsersController < ApplicationController
  layout 'simple'

  def show
    render locals: { user: User.find(params[:id]) }
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  def new
    render :new, locals: { user: User.new }
  end

  def create
    user = User.create! permitted_params

    flash.notice = t_flash(:registered, email: user.email)

    auto_login user

    redirect_to profile_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { user: e.record }
  end

  private

  def permitted_params
    params.fetch(:user, {}).permit :email, :password, :password_confirmation, :nick
  end
end
