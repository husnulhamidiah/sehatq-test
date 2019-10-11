require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/users/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/users/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Validation failed/)
      end
    end
  end

  describe 'GET /:id/appointments' do
    let!(:user) { create(:user) }
    let!(:hospital) { create(:hospital) }
    let!(:doctor) { create(:doctor, hospital_id: hospital.id) }
    let!(:appointment) { create(:appointment, user_id: user.id, doctor_id: doctor.id) }

    let(:headers) { valid_headers }

    context 'when valid request' do
      before { get "/users/#{user.id}/appointments", headers: headers }

      it 'return an appointment' do
        expect(response).to have_http_status(200)
        expect(json['data']).not_to be_nil
      end
    end

    context 'when unauthorized user' do
      let!(:another_user) { create(:user, id: 5739) }
      before { get "/users/#{another_user.id}/appointments", headers: headers }

      it 'does not return an appointment' do
        expect(response).to have_http_status(401)
      end

      it 'returns unauthorized message' do
        expect(json['message']).to match(/Unauthorized/)
      end
    end

    context 'when user not found' do
      before { get '/users/1390/appointments', headers: headers }

      it 'does not return an appointment' do
        expect(response).to have_http_status(404)
      end

      it 'returns unauthorized message' do
        expect(json['message']).to match(/Couldn't find User with/)
      end
    end

    context 'when invalid request' do
      let(:headers) { valid_headers.except('Authorization') }
      before { get "/users/#{user.id}/appointments", headers: headers }

      it 'does not return an appointment' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Missing token/)
      end
    end
  end
end