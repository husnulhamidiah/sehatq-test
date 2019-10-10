class HospitalsController < ApplicationController
  def index
    hospitals = Hospital.includes(:doctors)
    render json: HospitalSerializer.new(hospitals, { include: [:doctors] }).serialized_json
  end
end
