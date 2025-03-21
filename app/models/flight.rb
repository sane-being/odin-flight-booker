class Flight < ApplicationRecord
  # associations
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings

  # validations
  validates :departure_datetime, presence: true
  validates :arrival_datetime, presence: true, comparison: { greater_than: :departure_datetime }
  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true, comparison: { other_than: :departure_airport_id }
end
