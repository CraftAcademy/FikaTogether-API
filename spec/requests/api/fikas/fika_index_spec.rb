RSpec.describe 'GET /api/fikas', type: :request do
  subject { response }

  describe 'when there are fikas in the database' do
    # let(:fika_1) { create(:fika) }

    before do
      get '/api/fikas'
    end

    it { is_expected.to have_http_status 200}
  end
end
