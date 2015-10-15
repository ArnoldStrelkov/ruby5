class SessionsController < ApplicationController
   #include SessionsHelper 
    
  def new
    @base = Post.order('id')
  @users = User.order(id: :asc)
  (@my_id = @current_user.id) if @current_user
  @main = 'active'
   
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
   user = User.find_by(email: email)
     if user 
      
       UserMailer.welcome_email(email, user.token).deliver_later
 
       redirect_to :root
     
     
     # render text: params[:email].to_s and return
      
      #&& user.authenticate(params[:password])
   
   #sign_in user
   
    #div = render_to_string 'sessions/new', layout: false
    #my_hash = {result: "false", div: div}
    #my = JSON.generate(my_hash)
    #render json: my and return
   
    #redirect_to :root
 
     else
     
      user = User.create(email: email, name: email)
      UserMailer.welcome_email(email, user.token).deliver_later
      render text: 'для входа перейдите по ссылке в письме которое мы отправили на ваш емэйл' and return
    
    
     end  
  end 
  
  def enter
      user = User.find_by(token: params[:id])
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
