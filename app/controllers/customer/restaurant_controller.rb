class Customer::RestaurantController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  # def restaurant_params
  #   params.require(:restaurant).permit(:name, :capacity, :phone_number, :street_number, :street_name, :city, :province, :country, :postal_code)
  # end
  
end
