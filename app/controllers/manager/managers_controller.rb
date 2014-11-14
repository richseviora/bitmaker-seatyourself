class Manager::ManagersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  before_action :ensure_logged_in

  def current_user
    user = super
    redirect_to new_session_path unless user.is_a?(RestaurantManager)
    user
  end

  def handle_not_found
    redirect_to restaurant_root
  end
end