class Booking < ApplicationRecord
  # associations
  belongs_to :flight
  has_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers,
    allow_destroy: true,
    reject_if: lambda { |attributes| attributes["kind"].blank? }
end
