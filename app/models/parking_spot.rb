class ParkingSpot < ApplicationRecord
  has_many :parking_lot

  scope :available, -> { where(occupied: false) }
end
