RSpec.describe 'DELETE /api/participants', type: :request do
subject { response }
let(:admin) { create(:admin) }
let(:credentials) { admin.create_new_auth_token }

  describe 'successful' do
    let!(:department) { create(:department, name: 'HR') }

    before do
      delete '/api/participants',
      params: {  participant: { name: 'John Snow',
                                    email: 'John@Fika.com',
                                    start_date: '2000-01-01',
                                    department: 'HR',
                                    management: false,
                                    seniority: 2 } },
           headers: credentials
    end

    it { is_expected.to have_http_status(202) } 

    it 'is expected to return a message' do
      expect(json['message']).to eq('You have successfully deleted the participant')
    end

    it 'is expected to delete the participant' do
      expect(Participant.count).to eq 0
    end
  end
end