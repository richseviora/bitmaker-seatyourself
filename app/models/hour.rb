class Hour < ActiveRecord::Base
  belongs_to :restaurant
  validates_presence_of :start_hour, :end_hour, :day_of_week

  # TODO Add validation for end hour is greater than start hour.
end
