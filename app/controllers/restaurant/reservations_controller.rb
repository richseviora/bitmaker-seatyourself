class Restaurant::ReservationsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  before_action :find_reservation

  def approve
    @reservation.status = :accepted
    if @reservation.save
      redirect_to restaurant_root_path, notice: "Reservation #{@reservation.id} accepted."
    else
      redirect_to restaurant_root_path, notice: "Reservation #{@reservation.id} could not be approved"
    end
  end

  def reject
    @reservation.status = :accepted
    if @reservation.save
      redirect_to restaurant_root_path, notice: "Reservation #{@reservation.id} declined."
    else
      redirect_to restaurant_root_path, notice: "Reservation #{@reservation.id} could not be declined."
    end
  end

  private

  def find_reservation
    @reservation = current_user.restaurant.reservations.find(params[:id])
  end

  def current_user
    # TODO Replace with current user method once available.
    RestaurantManager.first
  end

  def handle_not_found
    redirect_to restaurant_root
  end
end
