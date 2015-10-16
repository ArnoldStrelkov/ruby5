class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)`[a-z]{2,})\z/i
                    
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


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
    
    has_many :posts, dependent: :destroy
    has_many :savedposts, dependent: :destroy
    
    

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

