class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :party_size
      t.integer :status
      t.datetime :date

      t.timestamps
    end
  end
end
