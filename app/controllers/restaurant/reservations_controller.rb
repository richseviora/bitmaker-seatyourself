class Restaurant::ReservationsController < ApplicationController

  def approve

  end

  def decline

  end

  private

  def current_user
    # TODO Replace with current user method once available.
    RestaurantManager.first
  end
end
