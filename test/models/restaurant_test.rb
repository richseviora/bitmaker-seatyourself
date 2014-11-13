require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test 'Getting the Right Hours Back' do
    restaurant = Restaurant.first
    puts restaurant
    assert_equal([9,20],restaurant.hours_for_date(Date.new))
  end
end
