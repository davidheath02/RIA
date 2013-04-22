class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :company_id
      t.string :industry_name
      t.string :co_name
      t.string :co_type
      t.string :co_ticker
      t.datetime :read_at

      t.timestamps
    end
  end
end
