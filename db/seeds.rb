# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rest = Restaurant.new
rest.name = 'Bob'
rest.phone_number = '647-300-6660'
rest.capacity = 15
rest.street_name = 'Bloor St W'
rest.street_number = '15'
rest.city = 'Toronto'
rest.postal_code = 'M4W3Y3'
rest.province = 'Ontario'
rest.country = 'Canada'
rest.save

rest_two = Restaurant.new
rest_two.name = 'McDonalds'
rest_two.phone_number = '647-300-6660'
rest_two.capacity = 30
rest_two.street_name = 'Bloor St W'
rest_two.street_number = '55'
rest_two.city = 'Toronto'
rest_two.postal_code = 'M4W4Y3'
rest_two.province = 'Ontario'
rest_two.country = 'Canada'
rest_two.save

customer = Customer.new
customer.name = 'Rich Seviora'
customer.email = 'richard@seviora.com'
customer.phone_number = '647-300-6660'
customer.password = '12345'
customer.save

customer_two = Customer.new
customer_two.name = 'Yung Dai'
customer_two.email = 'yungdai@gmail.com'
customer_two.phone_number = '647-300-6660'
customer_two.password = '12345'
customer_two.save

rest_manager = RestaurantManager.new
rest_manager.name = 'Philippe Schwyter'
rest_manager.email = 'pschwyter90@gmail.com'
rest_manager.phone_number = '647-300-6660'
rest_manager.password = '12345'
rest_manager.restaurant = Restaurant.first
rest_manager.save

admin = Administrator.new
admin.name = 'Darth Vader'
admin.email = 'darth@gmail.com'
admin.phone_number = '647-300-6660'
admin.password = '12345'
admin.save

reservation = Reservation.new
reservation.customer = Customer.first
reservation.restaurant = Restaurant.first
reservation.date = Date.new(2014,12,12)
reservation.party_size = 15
reservation.save

res_two = Reservation.new
res_two.customer = Customer.second
res_two.restaurant = Restaurant.second
res_two.date = Date.new(2014,12,11)
res_two.party_size = 10
res_two.save