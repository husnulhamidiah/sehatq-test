class DoctorsController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :index]
  before_action :set_resource, only: [:appointments]

  def index
    doctors = Doctor.includes(:hospital)
    json_response({
      data: DoctorSerializer.new(doctors, { include: [:hospital] }).as_json
    }, :ok)
  end

  def create
    ActiveRecord::Base.transaction do
      @user = User.create!(user_params)
      @resource = Doctor.create!(doctor_params.to_h.merge!({ user_id: @user.id }))
    end

    auth_token = AuthenticateUser.new(@user.email, @user.password).call

    json_response({
      data: DoctorSerializer.new(@resource, { include: [:user, :hospital] }).as_json,
      message: 'Account created successfully',
      token: auth_token
    }, :created)
  end

  def appointments
    return json_response({ message: 'Unauthorized' }, :unauthorized) if @current_user.doctor.id != params[:id].to_i
    
    appointments = Appointment.includes(:user, :doctor).where(doctor_id: @resource.id)
    json_response({
      data: AppointmentSerializer.new(appointments, { include: [:user, :doctor] }).as_json
    }, :ok)
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
