class ApiController < ApplicationController

def del_post
  id = params[:id]
  obj = Post.find(id)
  obj.destroy if obj.user.id == @current_user.id
  
  render text: '1'
end

def get_edit
  id = params[:id]
  @post = Post.find(id)
  render  layout: false
  
end


def update
 
   text = params[:body]
   header = params[:header]
   picture = params[:picture]
   obj = Post.find(params[:id])
    obj.update(body: text, picture: picture, header: header) if obj.user.id == @current_user.id
    @all = []
    @all = @all << obj
   #render text: res.body
    render  'main', layout: false
    
  
end

def saved
   id = params[:id]
   u = Savedpost.find_by(post_id: id, user_id: @current_user.id)
   if  u.nil?
   Savedpost.create(post_id: id, user_id: @current_user.id)
   render text: 'добавили'
   else
   u.destroy
    render text: 'удалили'
   end  
    
end

def read
 
   id = params[:id]
   
   u = Feed.find_by(feed_id: id, user_id: @current_user.id)
   if  u.nil?
   Feed.create(feed_id: id, user_id: @current_user.id)
   render text: 'читаем'
   else
   u.destroy
    render text: 'не читаем'
   end  
   
    
end


def picture
   #№cookies[:tmp] = 5 if cookies[:tmp] == nil
   #cookies[:tmp] = cookies[:tmp].to_i + 1
     #tmp = User.find(cookies[:tmp])
  #tmp.update(avatar: params[:user][:avatar]) 
  #tmp.save(validate: false)
  #render text: tmp.avatar.url
  
  @current_user.update(avatar: params[:user][:avatar]) 
  @current_user.save(validate: false)
  render text: @current_user.avatar.url
end


def count4
  @id = params[:page]
  
  @target = 'user'
    
    (@my_id = @current_user.id) if @current_user
    
    
      @logo = true
      @all = Post.order(id: :desc).offset(10*@id.to_i).limit(10)
      @users = User.order(id: :asc)
      
   
     
    # render text: params.to_s
    render 'main', layout: false
 
end




end
    