class LoginMailer < ApplicationMailer
  def send_reset_password_instructions_notification(user)
    @user = user
    @token = user.reset_password_token
    mail to: @user.name, subject: 'パスワードリセット'
  end
end
