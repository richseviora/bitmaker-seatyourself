class Admin::AdminController < ApplicationController
  def index

  end

end

private
def user_params
  params.require(:user).permit(:email, :password, :password_confirmation, :name)
end
