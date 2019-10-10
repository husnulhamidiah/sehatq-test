class AppointmentsController < ApplicationController
  def create
    return head :unprocessable_entity if !valid?
    
    appointment = Appointment.new
    appointment.user_id = params[:user_id]
    appointment.doctor_id = params[:doctor_id]
    appointment.start_at = start_date
    appointment.end_at = end_date
    appointment.save!

    render json: AppointmentSerializer.new(appointment).serialized_json
  end

  private

  def valid?
    now = DateTime.now.in_time_zone

    # check if appointment time is in the past
    return false if start_date < now || end_date < now

    #  check if start_date > end_date
    return false if start_date > end_date

    # check if apointment time in weekend
    return false if (weekend?(start_date) || weekend?(end_date))

    doctor = Doctor.find params[:doctor_id]
    # check if appoinment time maximum within 30 minutes before start
    if (now.all_day.include? start_date)
      return false if start_date > doctor.start_at.hour - 30.minutes 
    end
    # check if appointment time covered by doctor schedule
    return false if !(doctor.start_at.hour..doctor.end_at.hour).cover? start_date.hour..end_date.hour

    # check if doctor has less than 10 appointments
    count = Appointment.where(doctor_id: params[:doctor_id])
      .where('start_at > ?', now).count
    return false if count >= 10

    # check if appointment time overlaps
    appointments = Appointment.where(doctor_id: params[:doctor_id], start_at: start_date.all_day)
    return appointments.reduce(true) do |acc, cur|
      acc = false if (start_date..end_date).overlaps? (cur.start_at + 1.second..cur.end_at - 1.second)
      acc
    end
  end

  def start_date
    params[:start_at].in_time_zone
  end

  def end_date
    params[:end_at].in_time_zone
  end

  def weekend?(date)
    date.saturday? || date.sunday?
  end
end
