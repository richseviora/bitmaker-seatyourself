class Restaurant < ActiveRecord::Base
  # For the sake of simplicity this model does not attempt to handle time offsets.
  # We would need to specify the hours in local time (done), store the locale and convert the specified hours into UTC when conducting any operations.
  has_many :reservations
  has_many :restaurant_managers
  geocoded_by :address, if: :address_changed?

  validates_presence_of :name, :capacity, :phone_number
  validates_presence_of :street_number, :street_name, :city, :province, :postal_code
  validates :capacity, :numericality => {greater_than: 0}
  validates_format_of :phone_number, :with => /\d{3}[ .-]?\d{3}[ .-]?\d{4}/, :message => 'Phone number must be in the
 format XXX-XXX-XXXX. Dashes/spaces/dots optional'

  # TODO Validate that the hours do not overlap.
  # TODO Implement hours as input string.

  # Determines whether capacity is available for a given party size.
  def available?(reservation_time, party_size)
    open_at_time(reservation_time) && available_capacity(reservation_time) >= party_size
  end

  def open_at_time(datetime)
    d = datetime
    start_time = DateTime.new(d.year, d.month, d.day, hours_for_date(datetime)[0])
    end_time = DateTime.new(d.year, d.month, d.day, hours_for_date(datetime)[1])
    datetime.between?(start_time, end_time)
  end

  def available_capacity(reservation_time)
    used_reservations = reservations.where(:date == reservation_time &&(:status == :pending || :status == :accepted)).sum(:party_size)
    capacity - used_reservations
  end

  def hours_for_date(requested_date)
    requested_date # Unused variable would need to be used if hours were set per day.
    JSON.restore(hours)['all_days']
  end

  def set_hours(start_hour, close_hour)
    # POC assumes same hours every day of the week.
    self.hours = JSON.generate({:all_days => [9,20]})
  end

  def address
    [street_number.to_s + ' ' + street_name, city, province, country, postal_code].join(',')
  end

  def address_changed?
    street_number_changed? || street_name_changed? || city_changed? || province_changed? || country_changed? || postal_code_changed?
  end
end
