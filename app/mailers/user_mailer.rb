class UserMailer < ApplicationMailer
    
    def welcome_email(euser, url)
    @euser = euser
    @url  = url
    mail(to: @euser, subject: 'Welcome to My  Site')
    
    end
  
end
