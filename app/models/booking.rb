class Booking < ApplicationRecord
  # associations
  belongs_to :flight
  has_many :passengers
end
