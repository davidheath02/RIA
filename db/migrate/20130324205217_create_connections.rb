class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :num_connections
      t.datetime :read_at

      t.timestamps
    end
  end
end
