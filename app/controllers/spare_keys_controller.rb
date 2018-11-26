class SpareKeysController < ApplicationController
  def index
  end

  def find
    room = Room.find_by(building: params[:building], number: params[:room])

    if !room.nil?
      keys = SpareKey.where(room_id: room.id).all.as_json

      keys.map do |k|
        unless k['student_id'].nil?
          student = Student.find(k['student_id'])
          k['fname'] = student.fname
          k['lname'] = student.lname
        end
      end

      render json: { room_exists: true, keys: keys }
    else
      render json: { room_exists: false }
    end
  end

  def update
    key = SpareKey.find(params[:key_id])
    student = Student.find_by(bannerID: params[:bannerID])
    student_id = nil

    unless student.nil?
      student_id = student.id
    end

    key.update(checked_out: params[:checkout_status], student_id: student_id)
    render json: { success: true }
  end
end
