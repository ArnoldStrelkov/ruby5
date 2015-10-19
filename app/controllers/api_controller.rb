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
   
  @current_user.update(avatar: params[:user][:avatar]) 
  @current_user.save(validate: false)
  render text: @current_user.avatar.url
end


def setchoise
  choise = params[:id]
  
  Choise.create(user_id: @current_user.id) unless  @current_user.choise
    
  
  case choise
  when ('investor')  
    @current_user.choise.update(investor: true) 
    text = 'инвестора'
  when ('biginvestor')  
    @current_user.choise.update(biginvestor: true) 
    text = 'бигинвестора'
  when ('commresant')  
    @current_user.choise.update(commresant: true) 
    text = 'предпринимателя'
  when ('mentor')  
    @current_user.choise.update(mentor: true) 
    text = 'ментора'
  when ('customer')  
    @current_user.choise.update(customer: true) 
    text = 'клиента'
  end
  
  render text: text
 
 
end


def count4
  @id = params[:id]
  
  @target = 'user'
    
    (@my_id = @current_user.id) if @current_user
    
    items = User.find(@id.to_i).followed_ids
      @logo = true
      @all = Post.where(user_id: items).order(id: :desc).limit(10)
      
      @users = User.find(@id.to_i).followeds
      
   
     
    # render text: params.to_s
    render 'main', layout: "main"
 
end




end
    