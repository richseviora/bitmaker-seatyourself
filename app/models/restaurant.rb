class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :restaurant_managers
  has_many :hours

  
end
