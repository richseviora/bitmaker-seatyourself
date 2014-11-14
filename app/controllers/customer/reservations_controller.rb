class Customer::ReservationsController < ApplicationController
  before_action :current_user
  before_action :load_restaurant, except: [:cancel, :edit, :update]

  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = @restaurant.reservations.new
  end

  def create
    @reservation = @restaurant.reservations.build
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.date = DateTime.new(*params[:reservation].values.map{|x| x.to_i }[0..4])
    @reservation.customer = current_user
    
    if @reservation.save
      puts @reservation.inspect
      redirect_to customer_path(@reservation.customer.id)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @customer = current_user
  end
  
  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to customer_path(current_user.id)
    else
      render :edit
    end
  end

  def cancel
    @reservation = current_user.reservations.find(params[:id])
    @reservation.status = :cancelled
    if @reservation.save
      redirect_to customer_path(current_user.id)
    else
      redirect_to customer_path(current_user.id)
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
