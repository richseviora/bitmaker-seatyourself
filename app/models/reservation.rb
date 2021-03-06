class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :restaurant
  enum status: [:pending, :accepted, :cancelled]
  validates_presence_of :date, :party_size, :status
  validates_numericality_of :party_size, :greater_than => 0
  # TODO Add validation that reservation is not in the past (reservation date >= current date/time during creation)

  #validate :availability

	private

	def availability
		unless restaurant.available?(self.date, self.party_size)
			errors.add(:base, "Restaurant is full")
		end
	end
end
