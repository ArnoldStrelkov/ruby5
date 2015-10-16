class SessionsController < ApplicationController
   #include SessionsHelper 
    
  def new
    @base = Post.order('id')
  @users = User.order(id: :asc)
  (@my_id = @current_user.id) if @current_user
  @main = 'active'
  @target = 'user'
   
   render  layout: 'main'
  end

  def create
      
      
    user = User.find_by(email: params[:email].downcase)
  if user && user.authenticate(params[:password])
   
   sign_in user
   
    #div = render_to_string 'sessions/new', layout: false
    #my_hash = {result: "false", div: div}
    #my = JSON.generate(my_hash)
    #render json: my and return
   
    redirect_to :root
 
  else
      
      
    flash.now[:error] = 'Invalid email/password combination' 
   @users = User.order(id: :asc)
     render :new, layout: 'main' 
    
    #div = render_to_string 'sessions/new', layout: false
    #my_hash = {result: "true", div: div}
   # my = JSON.generate(my_hash)
   # render json: my
    
    
  end  
       
  end

  def destroy
     
    # cookies.delete(:id)
     cookies.delete(:remember_token)
     self.current_user = nil
     redirect_to :root
      
  end
  
  def email_enter
      
   email = params[:email].downcase
   @target = email.split('@')[1]
   name = email.split('@')[0]
   user = User.find_by(email: email)
   
   remember_token = User.new_remember_token
    
    
   
     if user
         
       user.update_attribute(:token, User.encrypt(remember_token))
      
       UserMailer.welcome_email(email, remember_token).deliver_later
   
     else
       #user = User.create(email: email, name: name)
       user = User.new(email: email, name: name, token: User.encrypt(remember_token))
       if user.save
      UserMailer.welcome_email(email, remember_token).deliver_later
       else
           flash.now[:error] = 'Invalid email' 
   @users = User.order(id: :asc)
     render  :new, layout: false and return
       end       
      
     end  
     
   
   render layout: false 
  end 
  
  def enter
      user = User.find_by(token: User.encrypt(params[:id]))
       if user 
   
         sign_in user
   
    #div = render_to_string 'sessions/new', layout: false
    #my_hash = {result: "false", div: div}
    #my = JSON.generate(my_hash)
    #render json: my and return
   
        redirect_to :root
 
       else
         render text: 'неверный ключ' and return
       end
      
      
      
  end 
  
  
  
end
