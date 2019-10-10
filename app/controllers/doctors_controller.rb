class DoctorsController < ApplicationController
  def index
    doctors = Doctor.all
    render json: DoctorSerializer.new(doctors).serialized_json
  end
end
