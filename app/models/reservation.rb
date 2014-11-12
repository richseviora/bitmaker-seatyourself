class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates_presence_of :date, :party_size, :status
  validates_numericality_of :party_size
end
