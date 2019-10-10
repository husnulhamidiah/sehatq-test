class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_resource, only: [:appointments]

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    json_response({ data: user.as_json.merge!(token: auth_token) }, :created)
  end
  
  def appointments
    appointments = Appointment.includes(:user, :doctor).where(user_id: @resource.id)
    render json: AppointmentSerializer.new(appointments, { include: [:user, :doctor] }).serialized_json
  end

  private

  def set_resource
    @resource = User.find(params[:id])
  end

  def user_params
    params.permit(
      :username,
      :name,
      :password,
      :password_confirmation
    )
  end
end
