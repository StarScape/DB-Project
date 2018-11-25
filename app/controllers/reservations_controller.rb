class ReservationsController < ApplicationController
  def index
  end

  def find
    room = Room.find_by(building: params[:building], number: params[:room])

    if !room.nil?
      reservations = Reservation.where(room_id: room.id).all
      render json: { room_exists: true, reservations: reservations }
    else
      render json: { room_exists: false }
    end
  end

  def create
    room = Room.find_by(building: params[:building], number: params[:room])
    start_date = Date.parse params[:start]
    end_date = Date.parse params[:end]

    Reservation.create(start_date: start_date, end_date: end_date, room_id: room.id)
    render json: { success: true }
  end

  # Update checkin status
  def update
    id = params[:id]
    reservation = Reservation.find(id)
    reservation.update(checked_in: params[:checked_in])

    render json: { success: true }
  end

  def destroy
    id = params[:reservation_id]
    reservation = Reservation.find(id)

    if !reservation.nil?
      reservation.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end
end
