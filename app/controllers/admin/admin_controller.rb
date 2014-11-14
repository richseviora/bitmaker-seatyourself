class Admin::AdminController < ApplicationController
  def index

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_url
  end


private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

