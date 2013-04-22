class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :country_code
      t.string :country_name
      t.datetime :read_at

      t.timestamps
    end
  end
end
