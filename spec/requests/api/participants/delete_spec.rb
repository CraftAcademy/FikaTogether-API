RSpec.describe 'DELETE /api/participants', type: :request do
subject { response }
let(:admin) { create(:admin) }
let(:credentials) { admin.create_new_auth_token }

  describe 'successful' do
    let!(:department) { create(:department, name: 'HR') }
    let!(:participant) { create(:participant, department: department) }
    before do
      delete "/api/participants/#{participant.id}",
           headers: credentials
    end

    it { is_expected.to have_http_status(202) } 

    it 'is expected to return a message' do
      expect(response_json['message']).to eq('You successfully deleted the participant from the department.')
    end

    it 'is expected to delete the participant' do
      expect(Participant.count).to eq 0
    end
  end

  describe 'unsuccessful' do
    before do
      delete '/api/participants/0',
           headers: credentials
    end

    it { is_expected.to have_http_status(422) } 

    it 'is expected to return an error message' do
      expect(response_json['error']).to eq('Your request can not be processed at this time')
    end
  end

end