class Admin::UsersController < ApplicationController
  def current_user
    Administrator.first
    # TODO Replace with current user method once available.
  end

  helper_method 'current_user'
end
