RSpec.describe 'GET /api/fikas', type: :request do
  subject { response }

  describe 'when there are fikas in the database' do
    let!(:participant_1) { create(:participant) }
    let!(:participant_2) { create(:participant) }
    let!(:fika) { 3.times { create(:fika, participants: [participant_1, participant_2]) } }

    before do
      get '/api/fikas'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return all fikas' do
      expect(response_json['fikas'].count).to eq 3
    end

    it 'is expected to return a start date' do
      expect(response_json['fikas'].last['start_date']).to eq '25/1/2017 09:00'
    end

    it 'is expected to return two participants' do
      expect(response_json['fikas'].last['participants'].count).to eq 2
    end

    it 'is expected to return a float at the similarity score between the two participants' do
      expect(response_json['fikas'].last['similarity']).to be_kind_of(Float)
    end
    
    it 'is expected that the similarity score is between 0 and 1' do
      expect(response_json['fikas'].last['similarity']).to be_between(0, 1)
    end
  end

  describe 'when there are no fikas in the databse' do
    before do
      get '/api/fikas'
    end

    it { is_expected.to have_http_status 404 }

    it 'is expected to return with a message indicating there are no fikas' do
      expect(response_json['message']).to eq 'There are no fikas in the database'
    end
  end
end
