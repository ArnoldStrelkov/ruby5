class Post < ActiveRecord::Base
    mount_uploader :picture , PictureUploader
    belongs_to :user
    has_many :savedposts, dependent: :destroy
    
end
