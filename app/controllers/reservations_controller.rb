class ReservationsController < ApplicationController
  def index
  end

  def find
    room = Room.find_by(building: params[:building], number: params[:room])

    if !room.nil?
      # Insecure, don't care
      # connection = ActiveRecord::Base::connection
      # reservations = connection.exec_query("SELECT * FROM reservations as r JOIN students as s ON s.id = r.student_id WHERE r.room_id=#{room.id}")
      reservations = Reservation.where(room_id: room.id).all.as_json
      reservations.map do |r|
        student = Student.find(r["student_id"])
        r["lname"] = student.lname
        r["bannerID"] = student.bannerID
      end

      render json: { room_exists: true, reservations: reservations }
    else
      render json: { room_exists: false }
    end
  end

  def create
    room = Room.find_by(building: params[:building], number: params[:room])
    student_id = Student.find_by(bannerID: params[:bannerID]).id
    start_date = Date.parse params[:start]
    end_date = Date.parse params[:end]

    Reservation.create(start_date: start_date, end_date: end_date, room_id: room.id, student_id: student_id)
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
