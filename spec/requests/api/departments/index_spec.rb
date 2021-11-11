RSpec.describe 'GET /api/departments', type: :request do
  subject { response }

  describe 'when there are departments in the database' do
    let!(:department) { create(:department) }
    

    before do
      get '/api/departments'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected that department has a name' do
      binding.pry
      # expect(response_json['departments'].first['name']).to be_truthy
    end

  end

  describe 'when there are no departments in the database' do
    before do
      get '/api/departments'
    end

    it { is_expected.to have_http_status 404 }

    it 'is expected that there are no departments' do
      expect(response_json['message']).to 'There are no departments in the database'
    end
  end
end