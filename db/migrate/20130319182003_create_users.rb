class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :profile_url
      t.string :firstName
      t.datetime :read_at

      t.timestamps
    end
  end
end
