class Hour < ActiveRecord::Base
  belongs_to :restaurant
  enum :day_of_week => [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  validates_presence_of :start_hour, :end_hour, :day_of_week
  validates_numericality_of :start_hour, :end_hour, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 24
  # TODO Add validation for end hour is greater than start hour.

end
