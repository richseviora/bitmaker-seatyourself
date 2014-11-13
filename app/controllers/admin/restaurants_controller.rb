class Admin::RestaurantsController < ApplicationController
  def current_user
    Administrator.first
    # TODO Replace with current_user method once available.
  end

  helper_method 'current_user'
end
