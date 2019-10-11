require 'rails_helper'

RSpec.describe 'Appointments API', type: :request do
  let!(:user) { create(:user) }
  let!(:hospital) { create(:hospital) }
  let!(:doctor) { create(:doctor, hospital_id: hospital.id) }
  let(:headers) { valid_headers }

  let(:valid_attributes) do
    {
      user_id: user.id,
      doctor_id: doctor.id,
      start_at: Date.today.beginning_of_week + 7.days + 9.hours,
      end_at: Date.today.beginning_of_week + 7.days + 10.hours
    }
  end

  describe 'POST /' do
    context 'when valid request' do
      before { post '/appointments', params: valid_attributes.to_json, headers: headers }

      it 'creates a new appointment' do
        expect(response).to have_http_status(201)
        expect(json['data']).not_to be_nil
      end
    end

    context 'when overlap' do
      let!(:appointment) { create(
        :appointment,
        user_id: user.id,
        doctor_id: doctor.id,
        start_at: Date.today.beginning_of_week + 7.days + 9.hours,
        end_at: Date.today.beginning_of_week + 7.days + 10.hours
      ) }
      before { post '/appointments', params: valid_attributes.to_json, headers: headers }

      it 'does not creates a new appointment' do
        expect(response).to have_http_status(422)
        expect(json['data']).to be_nil
      end
    end

    context 'when invalid request' do
      let(:headers) { valid_headers.except('Authorization') }
      before { post "/appointments", headers: headers }

      it 'does not return an appointment' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Missing token/)
      end
    end
  end
end