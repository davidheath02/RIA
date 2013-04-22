class CreateCoSizes < ActiveRecord::Migration
  def change
    create_table :co_sizes do |t|
      t.integer :company_id
      t.string :no_employees
      t.datetime :read_at

      t.timestamps
    end
  end
end
