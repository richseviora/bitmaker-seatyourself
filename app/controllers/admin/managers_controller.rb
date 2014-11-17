class Admin::ManagersController < ApplicationController
  def edit
    @manager = RestaurantManager.find(params[:id])
  end

  def create
  end

  def destroy
  end

  def manager_params
    params.require(:manager).permit(:email, :password, :password_confirmation, :name)
  end

end
