class UserMailer < ApplicationMailer
  default from: ENV['SENDMAIL_USERNAME']

  def welcome_email(user)
    @user = user
    

    mail(to: @user.email,
         subject: 'Bienvenido a SACO',
         cc: ENV['CC_EMAIL'],
         bcc: ENV['BCC_EMAIL'] )

  end
end
