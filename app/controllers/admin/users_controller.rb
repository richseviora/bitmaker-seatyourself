class Admin::UsersController < ApplicationController
  def new
    @administrator = Administrator.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @administrator = Administrator.new(administrator_params)

    if @administrator.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def update
    @administrator = Administrator.find(params[:id])

    if @administrator.update_attributes(administrator_params)
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  helper_method 'current_user'

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path
  end


  private
  def administrator_params
    params.require(:administrator).permit(:name, :email, :password, :password_confirmation, :phone_number)
  end
end
