class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :job_id
      t.integer :user_id
      t.integer :company_id
      t.datetime :start_date
      t.string :is_current
      t.string :job_title
      t.textread_at :job_summary

      t.timestamps
    end
  end
end
