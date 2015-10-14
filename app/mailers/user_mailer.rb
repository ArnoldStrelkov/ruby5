class UserMailer < ApplicationMailer
    
    def welcome_email(user)
    @user = user
    @url  = 'http://simplecloud.ru'
    mail(to: 'wikiuspeha@gmail.com', subject: 'Welcome to My  Site')
    mail(to: 'viki5kuper@yandex.ru', subject: 'Welcome to My  Site')
    mail(to: 'dj_nikolai85@mail.ru', subject: 'Welcome to My  Site')
    end
  
end
