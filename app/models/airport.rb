class Airport < ApplicationRecord
  # validations
  validates :airport_code,
    length: { is: 3 },
    presence: true,
    uniqueness: true,
    format: { with: /\A[A-Z]+\z/, message: "only allows capital letters" }

  # associations
  has_many :departing_flights,
    foreign_key: "departure_airport_id",
    class_name: "Flight"
  has_many :arriving_flights,
    foreign_key: "arrival_airport_id",
    class_name: "Flights"
end
