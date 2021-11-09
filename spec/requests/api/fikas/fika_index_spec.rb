RSpec.describe 'GET /api/fikas', type: :request do
  subject { response }

  describe 'when there are fikas in the database' do
    # let(:fika_1) { create(:fika) }

    before do
      get '/api/fikas'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return all fikas' do
      expect(response_json['fikas'].count).to eq 3
    end

    it 'is expected to return a start date' do
      expect(response_json['fikas'].last['start_date']).to eq '2017-01-25T09:00:00'
    end
  end
end
