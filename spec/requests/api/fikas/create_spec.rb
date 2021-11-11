RSpec.describe 'POST /api/fikas', type: :request do
  subject { response }
  let(:admin) { create(:admin) }
  let(:credentials) { admin.create_new_auth_token }

  describe 'successfully' do
    # let!(:participants) { 2.times { create(:participant) } }
    let!(:participants_1) {create(:participant, name: "Fraser", start_date: Time.now-35.years, management: true, department: "gHR" ) }
    let!(:participants_2) {create(:participant, name: "Max", start_date: Time.now-2.years, management: false, department: "HR") }
    
    before do
      post '/api/fikas',
           headers: credentials
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to return a message' do
      expect(response_json['message']).to eq 'Fikas successfully created'
    end

    it 'is expected to create two fikas' do
      binding.pry
      expect(Fika.count).to eq 6
    end    
  end

  describe 'unsuccessfully' do
    describe 'when there are no participants' do
      before do
        post '/api/fikas',
             headers: credentials
      end

      it { is_expected.to have_http_status 404 }

      it 'is expected to return a message indicating that there are no participants' do
        expect(response_json['message']).to eq 'There are no participants in the database'
      end
    end

    describe 'when the user is not auhtorized' do
      before do
        post '/api/fikas'
      end

      it { is_expected.to have_http_status 401 }

      it 'is expected to return a message that user cannot create fikas' do
        expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
      end
    end
  end
end
