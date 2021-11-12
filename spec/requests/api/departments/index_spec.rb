RSpec.describe 'GET /api/departments', type: :request do
  subject { response }

  describe 'when there are departments in the database' do
    let!(:department) { create(:department) }
    let!(:participant) { create(:participant, department: department) }

    before do
      get '/api/departments'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected that department has a name' do
      expect(response_json['departments'].first['name']).to be_truthy
    end

    it 'is expected to have an average score' do
      expect(response_json['departments'].first['average_score']).to eq 1
    end

    it 'is expected to have a participant' do
      expect(response_json['departments'].first['participants'].first['name']).to eq participant.name
    end
  end

  describe 'when there are no departments in the database' do
    before do
      get '/api/departments'
    end

    it { is_expected.to have_http_status 404 }

    it 'is expected to return an error message when there are no departments' do
      expect(response_json['message']).to eq 'No departments found'
    end
  end
end
