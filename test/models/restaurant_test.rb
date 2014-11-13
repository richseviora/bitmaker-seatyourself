require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test 'Getting the Right Hours Back' do
    restaurant = Restaurant.first
    assert_equal([9,20],restaurant.hours_for_date(Date.new))
  end

  test 'Getting Correct Capacity' do
    restaurant = Restaurant.first
    assert_equal(20,restaurant.available_capacity(Date.new))
  end

  test 'Correctly Checking Hours are Open' do
    assert Restaurant.first.open_at_time(DateTime.new(2014,9,20,10))
  end

  test 'Correctly Saying Hours are Closed' do
    assert_not Restaurant.first.open_at_time(DateTime.new(2014,9,20,7))
  end

  test 'Getting Correct Capacity Once Reservation is Made' do
    reservation_time = DateTime.now
    restaurant = Restaurant.first
    reservation = Reservation.new
    reservation.customer = Customer.first
    reservation.restaurant = restaurant
    reservation.party_size = 10
    reservation.date = reservation_time
    reservation.save
    assert_equal(10,restaurant.available_capacity(reservation_time))
  end


  test 'Getting Invalid Response if At Capacity' do
    reservation_time = DateTime.now
    restaurant = Restaurant.first
    reservation = Reservation.new
    reservation.customer = Customer.first
    reservation.restaurant = restaurant
    reservation.party_size = 20
    reservation.date = reservation_time
    reservation.save
    assert_not(restaurant.available?(reservation_time, 10))
  end

end
