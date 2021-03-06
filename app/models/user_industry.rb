class UserIndustry < ActiveRecord::Base
  attr_accessible :industry_name, :read_at, :start_date, :user_id
  
  has_many :locations
  
  
  def self.search(search)
  if search
    where('industry_name LIKE ?', "%#{search}%")
  else
    scoped
  end
end
end
