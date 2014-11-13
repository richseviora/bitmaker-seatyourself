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
      session[:user_id] = user.id, :notice => "Logged in as #{user.name}"
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to # to be defined main_url, notice: "You have are logged in!"
  end
end
