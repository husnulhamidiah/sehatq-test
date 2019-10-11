class HospitalsController < ApplicationController
  skip_before_action :authorize_request, only: :index

  def index
    hospitals = Hospital.includes(:doctors)
    json_response({
      data: HospitalSerializer.new(hospitals, { include: [:doctors] }).as_json
    }, :ok)
  end
end
