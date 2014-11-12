class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capacity
      t.string :phone_number
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code

      t.timestamps
    end
  end
end
