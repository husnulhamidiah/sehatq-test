class DoctorsController < ApplicationController
  before_action :set_resource, only: [:appointments]

  def index
    doctors = Doctor.includes(:hospital)
    render json: DoctorSerializer.new(doctors, { include: [:hospital] }).serialized_json
  end

  def appointments
    appointments = Appointment.includes(:user, :doctor).where(doctor_id: @resource.id)
    render json: AppointmentSerializer.new(appointments, { include: [:user, :doctor] }).serialized_json
  end

  private

  def set_resource
    @resource = Doctor.find(params[:id])
  end
end
