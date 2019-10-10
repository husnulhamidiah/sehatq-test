class DoctorsController < ApplicationController
  def index
    doctors = Doctor.includes(:hospital)
    render json: DoctorSerializer.new(doctors, { include: [:hospital] }).serialized_json
  end
end
