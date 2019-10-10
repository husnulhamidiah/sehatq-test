class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_resource, only: [:appointments]

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    
    json_response({
      data: UserSerializer.new(user).as_json['data'],
      message: 'Account created successfully',
      token: auth_token
    }, :created)
  end
  
  def appointments
    return json_response({ message: 'Unauthorized' }, :unauthorized) if @current_user.id != params[:id].to_i
    
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
      :email,
      :password,
      :password_confirmation
    )
  end
end
