class UserMailer < ApplicationMailer
  default from: 'sistemasaco2018@gmail.com'

  def welcome_email(user)
    byebug
    @user = user
    @url  = 'http://sistemasaco2018'
    mail(to: "juampavilla@gmail.com", subject: 'Bienvenido a SACO' )
    format.html {
      render locals: { recipient_name: "John D." }
    }
  end
end
