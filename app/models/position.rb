class Position < ActiveRecord::Base
  attr_accessible :company_id, :is_current, :job_id, :job_summary, :job_title, :start_date, :user_id
end
