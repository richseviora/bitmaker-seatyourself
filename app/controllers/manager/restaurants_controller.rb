class Manager::RestaurantsController < Manager::ManagersController
  before_action :get_restaurant

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

  def get_restaurant
    @restaurant = current_user.restaurant
  end

  def restaurant_params
    # TODO Hours needs to be implemented.
    params.require(:restaurant).permit(:name, :phone_number, :street_number, :street_name, :city, :province, :country, :postal_code)
  end


end
