class UserMailer < ActionMailer::Base

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Activate Your QNDATE Account", from: "'QNDATE' <customerservice@lovebuzzapp.herokuapp.com>"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset", from: "'QNDATE' <customerservice@lovebuzzapp.herokuapp.com>"
  end
end
