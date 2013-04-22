class User < ActiveRecord::Base
  attr_accessible :firstName, :profile_url, :read_at, :user_id
  
 # has_one :location
  
end
