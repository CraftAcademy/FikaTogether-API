RSpec.describe 'GET /api/fikas', type: :request do
  subject { response }

  describe 'when there are fikas in the database' do
    let!(:fika_goer_1) { create(:fika_goer) }
    let!(:fika_goer_2) { create(:fika_goer) }
    let!(:fika) { 3.times { create(:fika, fika_goers: [fika_goer_1, fika_goer_2]) } }

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

    it 'is expected to return a start date' do
      expect(response_json['fikas'].last['end_date']).to eq '2017-01-25T09:30:00'
    end

    it 'is expected to return two fika goers' do
      expect(response_json['fikas'].last['fika_goers'].count).to eq 2
    end
    
  end
end
