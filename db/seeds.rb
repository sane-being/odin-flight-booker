# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airports_list = [ "ATL", "PEK", "DXB", "LAX", "HND", "LHR", "ORD", "CDG", "DFW", "AMS", "FRA", "IST", "SIN", "JFK", "ICN" ]

airports_list.each do |airport_code|
  Airport.find_or_create_by!(airport_code: airport_code)
end

airports_id_list = Airport.pluck(:id)
datetime_range = (Time.now..(Time.now + 60*60*24*31)) # upcoming 31 days
duration_range = (60*60..60*60*24)  # 1 hour to 24 hours
15.times do
  two_random_airports = airports_id_list.sample(2)
  dep_date = rand(datetime_range)
  Flight.find_or_create_by!(
    departure_datetime: dep_date,
    arrival_datetime: dep_date + rand(duration_range),
    departure_airport_id: two_random_airports[0],
    arrival_airport_id: two_random_airports[1]
  )
end
