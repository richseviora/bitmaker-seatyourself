class Restaurant::ReservationsController < ApplicationController

  private

  def current_user
    # TODO Replace with current user method once available.
    RestaurantManager.first
  end
end
