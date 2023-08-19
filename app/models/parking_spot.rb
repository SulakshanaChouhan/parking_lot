class ParkingSpot < ApplicationRecord
  has_many :parking

  scope :available, -> { where(occupied: false) }
  attribute :occupied, :boolean, default: false
end
