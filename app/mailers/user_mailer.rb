class UserMailer < ApplicationMailer
  default from: 'sistemasaco2018@gmail.com'

  def welcome_email(user)
    byebug
    @user = user
    @url  = 'http://sistemasaco2018'
    mail(to: "juampavilla@gmail.com", subject: 'Welcome to My Awesome Site' + @user.email)
  end
end
