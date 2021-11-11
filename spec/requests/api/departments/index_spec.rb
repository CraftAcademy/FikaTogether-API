RSpec.describe 'GET /api/departments', type: :request do
  subject { response }

  describe 'when there are departments in the database' do
  


    before do
      get '/api/departments'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected that department has a name' do
      binding.pry
    end
  end
end