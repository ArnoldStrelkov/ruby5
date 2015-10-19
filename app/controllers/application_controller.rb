class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #//= require turbolinks
  #require 'carrierwave'
  protect_from_forgery with: :null_session  # :exception
  include SessionsHelper
  before_action :login
  layout 'main'
  
   
def add
  
  @param =  params[:base][:body]
  Post.create(body: @param)
  
end
  
  
def new
      
  @hello = Post.new
  @all = Post.order('id')
  
end
  
 
  
  def post_ajax
    @user_id = params[:id]
    @all = Post.where(user_id: @user_id).order(id: :desc)
    @users = User.order(id: :asc)
    @single_user = User.find(@user_id)
    posts = render_to_string  layout: false
    name = render_to_string 'name', layout: false
    my_hash = {name: name, posts: posts}
    render json: JSON.generate(my_hash)
  end
  
 
  def posts
     @target = 'user'
    @user_id = params[:id]
    page = params[:page]
    (@my_id = @current_user.id) if @current_user
    
    if page.nil?
    
     if @user_id.nil?
      @logo = true
      @all = Post.order(id: :desc).limit(10)
      @users = User.order(id: :asc)
      
     else

      @all = Post.where(user_id: @user_id).order(id: :desc).limit(10)
      @users = User.order(id: :asc)
      @single_user = User.find(@user_id)
     end
     
     #render text: "post_ajax"
    render 'main', layout: 'main'
    
    
    else
        
        if @user_id.nil?
          @logo = true
          @all = Post.order(id: :desc).offset(10*page.to_i-10).limit(10)
          @users = User.order(id: :asc)
          
      
        else

           @all = Post.where(user_id: @user_id).order(id: :desc).offset(10*page.to_i-10).limit(10)
           @users = User.order(id: :asc)
           @single_user = User.find(@user_id)
           #render text: "post_ajax1"
        end
     
    
       render 'main', layout: false
       
        
    end
    
  end
  
  def addpost
    header = params[:header]
    text = params[:body] #.gsub(/(?:\n\r?|\r\n?)/, '<br>')
    picture = params[:picture]
    video = params[:video]
    res = Post.create(body: text, header: header, picture: picture, video: video, user_id: @current_user.id)
    @all = []
    @all = @all << res
   #render text: res.body
    render  'main', layout: false
  end
   
def saved
    
    page = params[:page]
    @target = 'saved'
    @user_id = params[:id]
    @my_id = @current_user.id
   
    usr = []
    @current_user.sposts.each {|o| usr << o.user_id }
    @users = User.find(usr)
    
    page.nil? ? offs = 1 : offs = page
    
          if @user_id.nil?
            @all = @current_user.sposts.offset(10*offs.to_i-10).limit(10)
          else
            @all = @current_user.sposts.offset(10*offs.to_i-10).limit(10).where(user_id: @user_id)        
            @single_user = User.find(@user_id) 
          end
          
    page.nil? ?  (render 'main', layout: 'main') : (render 'main', layout: false)
    
end
  
  
def feed
    
    page = params[:page]
    @target = 'feed'
    @user_id = params[:id]
    @my_id = @current_user.id 
    obj = Feed.where(user_id: @my_id)
    items = []
    obj.each {|o| items << o.feed_id  }
    @users = User.find(items)
    
    if  page.nil?
    
        if @user_id.nil?
            @all = Post.where(user_id: items).order(id: :desc).limit(10)
        else
            @all = Post.where(user_id: @user_id).order(id: :desc).limit(10)
            @single_user = User.find(@user_id)
        end
        render 'main', layout: 'main'
        
    else
        if @user_id.nil?
            @all = Post.where(user_id: items).order(id: :desc).offset(10*page.to_i-10).limit(10)
        else
            @all = Post.where(user_id: @user_id).order(id: :desc).offset(10*page.to_i-10).limit(10)
            @single_user = User.find(@user_id)
        end
        render 'main', layout: false
        
    
    end
end
  
def mail
 UserMailer.welcome_email('wikiuspeha@gmail.com').deliver_later 
 UserMailer.welcome_email('dj_nikolai85@mail.ru').deliver_later
 
 redirect_to :root
end  

end
