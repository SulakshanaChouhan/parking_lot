class Parking < ApplicationRecord
  belongs_to :parking_spot, class_name: 'ParkingSpot', foreign_key: 'spot_assigned'

  scope :valid, -> {where(is_active: true)}
  attribute :is_active, :boolean, default: true

  validates :car_registration_number, presence: true, format: { with: /\A[A-Z]{2}\d{2}[A-Z]{2}\d{4}\z/, message: "is not valid formate" }
  validates :car_color, presence: true

  def set_ticket_number
    self.update_column(:ticket_number, "TN/#{self.id.to_s.rjust(5, '0')}")
  end
end
