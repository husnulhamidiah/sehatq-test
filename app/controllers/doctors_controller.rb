class DoctorsController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_resource, only: [:appointments]

  def index
    doctors = Doctor.includes(:hospital)
    render json: DoctorSerializer.new(doctors, { include: [:hospital] }).serialized_json
  end

  def create
    ActiveRecord::Base.transaction do
      user = User.create!(user_params)
      @resource = Doctor.create!(doctor_params.to_h.merge!({ user_id: user.id }))
    end
    render json: DoctorSerializer.new(@resource, { include: [:user, :hospital] }).serialized_json
  end

  def appointments
    appointments = Appointment.includes(:user, :doctor).where(doctor_id: @resource.id)
    render json: AppointmentSerializer.new(appointments, { include: [:user, :doctor] }).serialized_json
  end

  private

  def set_resource
    @resource = Doctor.find(params[:id])
  end

  def user_params
    params.permit(
      :username,
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def doctor_params
    params[:start_at] = params[:start_at].in_time_zone
    params[:end_at] = params[:end_at].in_time_zone
    params.permit(
      :hospital_id,
      :start_at,
      :end_at
    )
  end
end
