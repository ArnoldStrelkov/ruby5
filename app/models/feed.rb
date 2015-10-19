class Feed < ActiveRecord::Base
    belongs_to :user, class_name: "Test"
    belongs_to :feed, class_name: "User"
    
end
