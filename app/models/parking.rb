class Parking < ApplicationRecord
  belongs_to :parking_spot, class_name: 'ParkingSpot', foreign_key: 'spot_assigned'

  scope :valid, -> {where(is_active: true)}
  attribute :is_active, :boolean, default: true
end
