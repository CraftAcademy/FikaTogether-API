RSpec.describe 'GET /api/departments', type: :request do
  subject { response }

  describe 'when there are departments in the database' do
    let!(:department_1) { create(:department) }
    let!(:department_2) { create(:department) }

    let!(:participant_1) { create(:participant, department: department_1, fika_score: 10) }
    let!(:participant_2) { create(:participant, department: department_1, fika_score: 14) }
    let!(:participant_3) { create(:participant, department: department_2, fika_score: 10) }
    let!(:participant_4) { create(:participant, department: department_2, fika_score: 14) }

    before do
      get '/api/departments'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected that department has a name' do
      expect(response_json['departments'].first['name']).to be_truthy
    end

    it 'is expected to have a participant' do
      expect(response_json['departments'].first['participants'].first['name']).to eq participant_1.name
    end

    it 'is expected to have a participants avatar' do
      expect(response_json['departments'].first['participants'].first).to include 'avatar'
    end

    it 'is expected that department_1 will have an average score of 12' do
      expect(response_json['departments'].first['average_score']).to eq 12
    end

    it 'is expected that department_1 will show it has 2 participants' do
      expect(response_json['departments'].first['number_of_participants']).to eq 2
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
