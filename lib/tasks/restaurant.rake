namespace :restaurant do
  desc "Updates coordinates on restaurants"
  task update_coordinates: :environment do
    Restaurant.where(:latitude => nil, :longitude => nil).each do |restaurant|
      restaurant.geocode
      if restaurant.save
        puts "#{restaurant.name} updated address successfully."
      else
        puts "#{restaurant.name} ERROR: failed to update."
      end
    end
  end
end
