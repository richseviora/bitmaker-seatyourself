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
    @user = User.find(params[:id])

    if @user.update_attributes(product_params)
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  helper_method 'current_user'

  def destroy
    session[:user_id] = nil
    redirect_to admin_root_path
  end

  private
  def administrator_params
    params.require(:administrator).permit(:name, :email, :password, :password_confirmation, :phone_number)
  end
end
