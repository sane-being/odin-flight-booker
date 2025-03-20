class Flight < ApplicationRecord
  # associations
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  # validations
  validates :departure_datetime, presence: true
  validates :flight_duration, presence: true
  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
end
