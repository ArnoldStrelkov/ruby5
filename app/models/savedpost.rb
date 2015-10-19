class Savedpost < ActiveRecord::Base
     belongs_to :user
     belongs_to :post
     default_scope { order(id: :desc) }
end
