class Airport < ApplicationRecord
  # validations
  validates :airport_code,
    length: { is: 3 },
    presence: true,
    uniqueness: true,
    format: { with: /\A[A-Z]+\z/, message: "only allows capital letters" }
end
