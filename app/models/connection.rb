class Connection < ActiveRecord::Base
  attr_accessible :num_connections, :read_at, :user_id
end
