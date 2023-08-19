class ParkingsController < ApplicationController
  layout false
  def index
    @parkings = Parking.valid
  end

  def show
    @parking = Parking.new
    render(params[:id])
  end

  def registration_numbers_by_color
    @registration_numbers = Parking.valid.where(car_color: params[:car_color]).pluck(:car_registration_number)    
  end

  def ticket_number_by_registration_number
    @ticket_numbers= Parking.valid.where(car_registration_number: params[:car_registration_number]).pluck(:ticket_number)
  end

  def ticket_numbers_by_color
    parkings = Parking.valid.where(car_color: params[:car_color])

    if parkings.present?
      @ticket_numbers = parkings.pluck(:ticket_number)
    else
      render json: { message: "No Parking Record found" }
    end
  end

  def park_car
    available_slot = ParkingSpot.available.min_by(&:distance_from_entry)

    if available_slot.present?
      data = {spot_assigned: available_slot.id,
      car_registration_number: params[:parkings][:car_registration_number],
      car_color: params[:parkings][:car_color]}

      parking = Parking.new(data)

      if parking.save
        parking.set_ticket_number
        available_slot.update!(occupied: true)
        redirect_to action: 'index'
      else
        render json: { message: parking.errors.full_messages.join(', ') }
      end

    else
      render json: { message: "Parking spot are not available." }
    end
  end

  def remove_car
    parking = Parking.valid.find_by(spot_assigned:params[:parkings][:spot_number])
    if parking.present?
      parking.update!(is_active: false)
      parking.parking_spot.update!(occupied: false)
      redirect_to(:action => 'index')
    else
      render json: { message: "Parking spot is invalid" }
    end
  end
end
