module SessionsHelper
    
    #def sign_in(user)
    #cookies.permanent[:id] = user.id
    #end
    
    
    def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:token, User.encrypt(remember_token))
    self.current_user = user
    end
    
    def login
    @current_user = User.find_by(token: User.encrypt(cookies[:remember_token]))
    end
    
    
    def current_user= (user)
    @current_user = user
    end
    
    def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(token: remember_token)
    end
    
    def signed_in?
    !current_user.nil?
    end
    
end
