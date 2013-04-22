class Location < ActiveRecord::Base
  attr_accessible :country_code, :country_name, :read_at, :user_id
  
  #has_many :users
  
end
