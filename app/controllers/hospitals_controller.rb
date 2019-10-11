class HospitalsController < ApplicationController
  def index
    hospitals = Hospital.includes(:doctors)
    json_response({
      data: HospitalSerializer.new(hospitals, { include: [:doctors] }).as_json
    }, :ok)
  end
end
