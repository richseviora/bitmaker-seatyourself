class Restaurant::RestaurantController < ApplicationController
  def show
    @restaurant = current_user.restaurant
  end

  private

  def current_user
    # TODO Replace with current user method once available.
    RestaurantManager.first
  end
end
