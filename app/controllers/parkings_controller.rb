class ParkingsController < ApplicationController
  def index
    parking_lots = Parking.valid
  end

  def registration_numbers_by_color
    parkings = Parking.valid.where(car_color: params[:car_color])

    if parkings.present?
      registration_numbers = parkings.pluck(:car_registration_number)
    else
      render json: { message: "No Registration Number Found" }
    end
  end

  def ticket_number_by_registration_number
    parking = Parking.valid.where(car_registration_number: params[:car_registration_number]).first
 
    if parking.present?
      ticket_number = parking.ticket_number
    else
      render json: { message: "Record not found" }
    end
  end

  def ticket_numbers_by_color
    parkings = Parking.valid.where(car_color: params[:car_color])

    if parkings.present?
      ticket_numbers = parkings.pluck(:ticket_number)
    else
      render json: { message: "No Parking Record found" }
    end
  end

  def park_car
    available_slot = ParkingSpot.available.min_by(&:distance_from_entry)

    if available_slot.present?
      data = {spot_assigned: available_slot.id,
      car_registration_number: params[:car_registration_number],
      car_color: params[:car_color]}
      
      parking_lot = ParkingLot.create!(data)
      parking_lot.set_ticket_number
      available_slot.update!(occupied: true)
    else
      render json: { message: "Parking spot are not available." }
    end
  end

  def remove_car
    parking = Parking.valid.find_by(param[:id])
    if parking.present?
      parking.update!(is_active: false)
      parking.parking_spot.update!(occupied: false)
    else
      render json: { message: "Parking spot is invalid" }
    end
  end
end
