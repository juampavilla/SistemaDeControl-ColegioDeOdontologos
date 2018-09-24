class UserMailer < ApplicationMailer
  default from: 'sistemasaco2018@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://sistemasaco2018'
    mail(to: "juampavilla@gmail.com", subject: 'Bienvenido a SACO' )
  end
end
