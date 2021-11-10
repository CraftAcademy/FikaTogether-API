RSpec.describe 'POST /api/fikas', type: :request do
    subject { response }
    let!(:participants) { 5.times { create(:participant) } }

    describe 'successfully' do
        before do
            post '/api/fikas'            
        end

        it { is_expected.to have_http_status 201 }

        it 'is expected to return a message' do
            expect(response_json['message']).to eq 'Fikas successfully created!!!'
        end

        it 'is expected to create two fikas' do
            expect(Fikas.all.count).to eq 6
        end
    end
end