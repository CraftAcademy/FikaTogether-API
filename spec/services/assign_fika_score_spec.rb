RSpec.describe 'AssignScoreService', type: :request do
  let!(:participant_1) { create(:participant, start_date: Time.now, fika_score: 0) }
  let(:admin) { create(:admin) }
  let(:credentials) { admin.create_new_auth_token }

  

  describe 'when the participants have a delta between their start dates of under 5 years' do
    let!(:participant_2) { create(:participant, start_date: Time.now - 1.years, fika_score: 0) }
    before do
      post '/api/fikas',
           headers: credentials
    end
    it 'is expected that the fika score will be split evenly between the participants' do
      expect(Fika.last.fika_score).to eq([5, 5])
    end

    it 'is expected that participant 1 will have a fika score of 5' do
      expect(participant_1.fika_score).to eq 5
    end
  end

  describe 'when the participants have a delta between their start dates of over 5 years' do
    let!(:participant_2) { create(:participant, start_date: Time.now - 6.years) }
    before do
      post '/api/fikas',
           headers: credentials
    end

    it 'is expected that the fika score will not be split evenly' do
      expect(Fika.last.fika_score).to eq([6, 4])
    end

    it 'is expected that participant 1 will have a fika score of 6' do
      expect(participant_1.fika_score).to eq 6
    end
  end

  describe 'when the participants have a delta between their start dates of over 10 years' do
    let!(:participant_2) { create(:participant, start_date: Time.now - 12.years) }
    before do
      post '/api/fikas',
           headers: credentials
    end

    it 'is expected that the fika score will not be split evenly' do
      expect(Fika.last.fika_score).to eq([7, 3])
    end

    it 'is expected that participant 1 will have a fika score of 7' do
      expect(participant_1.fika_score).to eq 7
    end
  end
end
