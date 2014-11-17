class Admin::ManagersController < ApplicationController
  def new
    @manager = RestaurantManager.new
  end

  def edit
    @manager = RestaurantManager.find(params[:id])
  end

  def create
    @manager = RestaurantManager.new(manager_params)
    if @manager.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def update
    @manager = RestaurantManager.find(params[:id])
    if @manager.update_attributes(manager_params)
      redirect_to admin_root_path
    end
  end

  def destroy
    @manager = RestaurantManager.find(params[:id])
    @manager.destroy
    redirect_to admin_root_path
  end


  helper_method 'current_user'
  def manager_params
    params.require(:restaurantmanager).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end

end
