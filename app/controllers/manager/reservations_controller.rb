class Manager::ReservationsController < Manager::ManagersController

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



end
