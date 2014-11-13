class CustomersController < ApplicationController
  def index
    @customers  = Customer.new
  end

  def new
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])

  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_show_url, notice: "Crated a new user!"
    else
      render "new"
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end

private
def user_params
  params.require(:customer).permit(:email, :password_digest, :name, :type, :phone_number, :restaurant_id)
end