class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer :start_hour
      t.integer :end_hour
      t.integer :day_of_week
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
