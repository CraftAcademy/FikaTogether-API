describe 'POST and GET /api/fikas, similarity functionality', type: :request do
  subject { response }
  let(:admin) { create(:admin) }
  let(:credentials) { admin.create_new_auth_token }

  describe 'when two participants have identical properties' do
    let!(:participant_1) do
      create(:participant, name: 'Fraser', start_date: Time.now - 2.years, management: false, department: 'HR')
    end
    let!(:participant_2) do
      create(:participant, name: 'Max', start_date: Time.now - 2.years, management: false, department: 'HR')
    end

    before do
      post '/api/fikas',
           headers: credentials
      get '/api/fikas'
    end

    it 'is expected to return 1 possible fika for 2 participants' do
      expect(response_json['fikas'].count).to eq 1
    end

    it 'is expected to return a similarity score that is very nearly 1' do
      expect(response_json['fikas'].last['similarity']).to be_within(0.00001).of(1.0)
    end
  end

  describe 'when the two participants are wildly different' do
    let!(:participant_1) do
      create(:participant, name: 'Dorian', start_date: Time.now - 1.years, management: true, department: 'Sailing')
    end
    let!(:participant_2) do
      create(:participant, name: 'August', start_date: Time.now - 27.years, management: false, department: 'Imports')
    end

    before do
      post '/api/fikas',
           headers: credentials
      get '/api/fikas'
    end

    it 'is expected to return a similarity score that is small' do
      expect(response_json['fikas'].last['similarity']).to be_within(0.1).of(0.1)
    end
  end
end
