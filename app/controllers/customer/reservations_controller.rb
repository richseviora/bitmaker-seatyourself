class Customer::ReservationsController < ApplicationController
  before_action :current_user
  before_action :load_restaurant


  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = @restaurant.reservations.new
  end

  def create
    @reservation = @restaurant.reservations.build
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.date = params[:reservation]['date(1i)'].to_i + params[:reservation]['date(2i)'].to_i + params[:reservation]['date(3i)'].to_i + params[:reservation]['date(4i)'].to_i + params[:reservation]['date(5i)'].to_i
    puts @reservation.date
    @reservation.customer = current_user
    
    if @reservation.save
      puts @reservation.inspect
      redirect_to customer_path(@reservation.customer.id)
    else
      2/0
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to customer_cust_reservations
    else
      render :edit
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:party_size, :date, :customer_id, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
