require 'rails_helper'

RSpec.describe 'Hospitals API', type: :request do
  describe 'GET /' do
    let!(:user) { create(:user) }
    let!(:hospital) { create(:hospital) }
    let!(:doctor) { create(:doctor, hospital_id: hospital.id) }

    let(:headers) { valid_headers }

    context 'when valid request' do
      before { get '/hospitals', headers: headers }

      it 'returns all hospitals' do
        expect(response).to have_http_status(200)
        expect(json['data']).not_to be_nil
      end
    end

    context 'when invalid request' do
      let(:headers) { valid_headers.except('Authorization') }
      before { get '/hospitals', headers: headers }

      it 'does not return hospitals' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Missing token/)
      end
    end
  end
end