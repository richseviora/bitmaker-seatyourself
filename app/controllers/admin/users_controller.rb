class Admin::UsersController < ApplicationController
  def new
    @administrator = Administrator.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @administrat = Administrator.new(administrator_params)

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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path
  end

  helper_method 'current_user'
  private
  def administrator_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number)
  end
end
