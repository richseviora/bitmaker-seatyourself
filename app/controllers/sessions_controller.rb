class SessionsController < ApplicationController
  def new
  end

  def create
    # find a user by the email typed in the email input field and assign it to the variable 'user'
    user = User.find_by(email: params[:email])
    # check if that user both exists and that it can be authenticated with the password typed in the password input
    # field
    if user && user.authenticate(params[:password])
      # create a key-value pair in the session hash ':user_id' is, with user.id being the value
      session[:user_id] = user.id
      # check to see what kind of Class Object user is equal to
      if user.kind_of?(Administrator)
        redirect_to admin_root, notice: "You're logged in!"
      elsif user.kind_of?(Customer)
        redirect_to customer_root, notice: "You're logged in!"
      elsif user.kind_of?(RestaurantManager)
        redirect_to restaurant_root, notice: "You're logged in!"
      else
        flash.now[:alert] = "Who are you?  I don't know what or who you are, but you should contact the administrator!!"
      end
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to #TODO must defined main_url, notice: "You have are logged in!"
  end
end
