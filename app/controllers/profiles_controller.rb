class ProfilesController < Private::ApplicationController
  def edit
    render :show, locals: { user: current_user }
  end

  def update
    pp = permitted_params

    if pp[:password].blank? && pp[:password_confirmation].blank?
      pp.delete :password
      pp.delete :password_confirmation
    end

    current_user.update! pp

    flash.now.notice = 'Профиль изменен'
    render :show, locals: { user: current_user }

  rescue ActiveRecord::RecordInvalid => e
    flash.now.notice = e.message
    render :show, locals: { user: e.record }, alert: e.messageA
  end

  def show
    render locals: { user: current_user }
  end

  private

  def permitted_params
    params.require(:user).permit(:nick, :email, :name, :image, :remove_image, :bio, :password, :password_confirmation)
  end
end
