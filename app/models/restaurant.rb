class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :restaurant_managers

  validates_presence_of :name, :capacity, :phone_number
  validates_presence_of :street_number, :street_name, :city, :province, :postal_code
  validates :capacity, :numericality => {greater_than: 0}
  validates_format_of :phone_number, :with => /\d{3}[ -]?\d{3}[ -]?\d{4}/, :message => 'Phone number must be in the format XXX-XXX-XXXX. Dashes/spaces optional'

  # TODO Validate that the hours do not overlap.
  # TODO Implement hours as input string.



  def hours_for_date(requested_date)
    JSON.restore(hours)[:all_days]
  end

  private

  # Assuming same hours every day of the week.
  def set_hours(start_hour, close_hour)
    hours = JSON.generate({:all_days => [9,20]})
  end
end
