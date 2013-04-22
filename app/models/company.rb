class Company < ActiveRecord::Base
  attr_accessible :co_name, :co_ticker, :co_type, :company_id, :industry_name, :read_at
end
