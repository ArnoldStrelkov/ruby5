
class User < ActiveRecord::Base
    #include AvatarUploader
    #require 'carrierwave'
    mount_uploader :avatar, AvatarUploader
    
    #validates :name,  presence: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, presence: true,  uniqueness: { case_sensitive: false }
    before_save { self.email = email.downcase }
    has_secure_password validations: false
    #validates :password,:length => { :minimum => 2 }
    #before_create :create_remember_token
    
    has_one :choise
    has_many :posts, dependent: :destroy
    has_many :savedposts, dependent: :destroy
    
    has_many :followeds, through: :feeds, source: :feed
    has_many :points, through: :feeds, source: :user
    has_many :followers, through: :revers_feeds, source: :user
    
    has_many :feeds, foreign_key: "user_id", class_name:  "Feed"
    has_many :revers_feeds, foreign_key: "feed_id", class_name:  "Feed"
    
    has_many :sposts, through: :savedposts, source: :post

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  

private

  def create_remember_token
      self.token = User.encrypt(User.new_remember_token)
  end
    
    
  
end

