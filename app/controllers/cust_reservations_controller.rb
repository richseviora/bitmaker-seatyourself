class CustReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservation.build(reservation_params)
    
    if @reservation.save
      redirect_to customer_cust_reservations
    else
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

  private

  def reservation_params
    params.require(:reservation).permit(:part_size, :date, :customer_id, :restaurant_id)
  end

end
