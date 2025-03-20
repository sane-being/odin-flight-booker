class Flight < ApplicationRecord
  # associations
  belongs_to :departure_airport, class_name: "Airport"
end
