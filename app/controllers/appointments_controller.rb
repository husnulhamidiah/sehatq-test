class AppointmentsController < ApplicationController
  def create
    binding.pry
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
    #  check if start_date < end_date
    return false if start_date > end_date

    # check if aapointment time in weekend
    return false if (weekend?(start_date) || weekend?(end_date))

    # check if appointment time covered by doctor schedule
    doctor = Doctor.find params[:doctor_id]
    return false if !(doctor.start_at.hour..doctor.end_at.hour).cover? start_date.hour..end_date.hour


    # check if appointment time overlaps
    appointments = Appointment.where(start_at: start_date.all_day)
    return appointments.reduce(true) do |acc, cur|
      acc = false if (start_date..end_date).overlaps? (cur.start_at + 1.second..cur.end_at - 1.second)
      acc
    end
  end

  def start_date
    params[:start_at].to_datetime
  end

  def end_date
    params[:end_at].to_datetime
  end

  def weekend?(date)
    date.saturday? || date.sunday?
  end
end
