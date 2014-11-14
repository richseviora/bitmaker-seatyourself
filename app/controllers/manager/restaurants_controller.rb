class Manager::RestaurantsController < ApplicationController
  before_action :ensure_logged_in
  before_action :get_restaurant
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def show
  end


  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to manager_root_path, notice: 'Restaurant Updated'
    else
      render 'manager/restaurant/edit'
    end
  end

  private
  def current_user
    user = super
    unless user.is_a?(RestaurantManager)
      puts "User is a #{user.class}, Redirecting"
      redirect_to new_session_path
    end
    user
  end

  def handle_not_found
    redirect_to restaurant_root
  end

  def get_restaurant
    @restaurant = current_user.restaurant
  end

  def restaurant_params
    # TODO Hours needs to be implemented.
    params.require(:restaurant).permit(:name, :phone_number, :street_number, :street_name, :city, :province, :country, :postal_code)
  end


end
