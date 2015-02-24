class UserMailer < ActionMailer::Base

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation", from: "'NoReply' <noreply@lovebuzzapp.herokuapp.com>"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset", from: "'NoReply' <noreply@lovebuzzapp.herokuapp.com>"
  end
end
