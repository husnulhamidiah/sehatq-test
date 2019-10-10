class UsersController < ApplicationController
  before_action :set_resource, only: [:appointments]

  def appointments
    appointments = Appointment.includes(:user, :doctor).where(user_id: @resource.id)
    render json: AppointmentSerializer.new(appointments, { include: [:user, :doctor] }).serialized_json
  end

  private

  def set_resource
    @resource = User.find(params[:id])
  end
end
