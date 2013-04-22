class CreateUserIndustries < ActiveRecord::Migration
  def change
    create_table :user_industries do |t|
      t.integer :user_id
      t.string :industry_name
      t.datetime :start_date
      t.datetime :read_at

      t.timestamps
    end
  end
end
