RSpec.describe 'POST /api/participants', type: :request do
  subject { response }
  let(:admin) { create(:admin) }
  let(:credentials) { admin.create_new_auth_token }

  describe 'successful' do
    let!(:department) { create(:department) }

    before do
      post '/api/participants',
           params: { participant: { name: 'John Snow',
                                    email: 'John@Fika.com',
                                    start_date: '2000-01-01',
                                    department: 'HR',
                                    management: false,
                                    seniority: 2 } },
           headers: credentials
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to return a message' do
      expect(response_json['message']).to eq 'You successfully added participant to the department.'
    end

    it 'is expected to create a new participant' do
      expect(Participant.count).to eq 1
    end
  end
end
