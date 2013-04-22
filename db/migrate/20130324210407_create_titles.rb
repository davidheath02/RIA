class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.integer :user_id
      t.string :headline
      t.datetime :read_at

      t.timestamps
    end
  end
end
