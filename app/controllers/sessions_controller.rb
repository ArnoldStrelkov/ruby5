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
  
  
  
end
