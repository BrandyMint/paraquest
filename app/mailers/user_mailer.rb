class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @activation_url =  activate_user_url(id: user.activation_token || raise("User #{user.id} has no activation_token"))

    mail(to: user.email, subject: I18n.t('email.activation.subject'))
  end

  def activation_success_email(user)
    @user = user
    mail(to: user.email, subject: I18n.t('email.activation_success.subject'))
  end

  def reset_password_email(user)
    @user = user
    @reset_password_url = edit_password_reset_url(@user.reset_password_token || raise("User #{user.id} has no reset_password_token"))

    mail(to: user.email, subject: I18n.t('email.reset_password.subject'))
  end
end
