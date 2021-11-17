RSpec.describe 'POST /api/fikas', type: :request do
  subject { response }
  let(:admin) { create(:admin) }
  let(:credentials) { admin.create_new_auth_token }

  describe 'successfully' do
    let!(:participants) { 4.times { create(:participant) } }

    before do
      post '/api/fikas',
           headers: credentials
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to return a message' do
      expect(response_json['message']).to eq 'Fikas successfully created'
      
    end

    it 'is expected to create six fikas' do
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

    describe 'when google throws an authentication error', sad_token_mock: true do
      let!(:participants) { 4.times { create(:participant) } }
      before do
        post '/api/fikas',
             headers: credentials
      end

      it { is_expected.to have_http_status 400 }

      it 'is expected to return a message that user cannot create fikas' do
        expect(response_json['message']).to eq 'We are experiencing problems with Google calendar at the moment, please try again later!'
      end
    end

    describe 'when google throws a bad request error', sad_create_event_mock: true do
      let!(:participants) { 4.times { create(:participant) } }
      before do
        post '/api/fikas',
             headers: credentials
      end

      it { is_expected.to have_http_status 400 }

      it 'is expected to return a message that user cannot create fikas' do
        expect(response_json['message']).to eq 'We are experiencing problems with Google calendar at the moment, please try again later!'
      end
    end
  end
end
