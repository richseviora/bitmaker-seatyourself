class Admin::AdminController < ApplicationController
  def index

  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @administrator = Administrator.new(administrator_params)

    if @administrator.save
      redirect_to admin_user_url
    else
      render :new
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_url
  end

  helper_method 'current_user'

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
