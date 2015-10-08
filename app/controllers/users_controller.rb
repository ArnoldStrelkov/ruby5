class UsersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #//= require turbolinks
  protect_from_forgery with: :null_session  # :exception
  include SessionsHelper
  
  def show
  @user = User.find(params[:id])
  end
  
  def new
  @user = User.new
  
  @base = Post.order('id')
  @users = User.order(id: :asc)
  (@my_id = @current_user.id) if @current_user
  @main = 'active'
  
   render  layout: 'main'
  end
  
  def create
   @users = User.order(id: :asc) 
   @user = User.new(user_params)    
    if @user.save
         sign_in @user
         
      redirect_to :root
    else
      render 'new'
    end
  end

private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  
end
