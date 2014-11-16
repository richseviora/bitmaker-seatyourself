class Admin::RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    # build a new restaurant using the build command with the parameters from the private restaurant_params private
    # method
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(product_params)
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(restaurant_params[:id])
    @restaurant.destroy
    redirect_to admin_root_path
  end

  helper_method 'current_user'

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity, :phone_number, :street_number, :street_name, :city, :province, :country, :postal_code)
  end
end
