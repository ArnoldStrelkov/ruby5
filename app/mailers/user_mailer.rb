class UserMailer < ApplicationMailer
    
    def welcome_email(euser)
    @euser = euser
    @url  = 'http://simplecloud.ru'
    mail(to: @euser, subject: 'Welcome to My  Site')
    
    end
  
end
