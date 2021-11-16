RSpec.describe 'SimilarityService', type: :service do
  describe 'when two participants have identical properties' do
    let!(:participant_1) do
      create(:participant, name: 'Fraser', start_date: Time.now - 2.years, management: false)
    end

    let!(:participant_2) do
      create(:participant, name: 'Max', start_date: Time.now - 2.years, management: false)
    end

    it 'is expected to return a similarity score that is very nearly 1' do
      expect(SimilarityService.cosine_similarity([participant_1, participant_2])).to be_within(0.00001).of(1.0)
    end
  end

  describe 'when the two participants are wildly different' do
    let!(:participant_1) do
      create(:participant, name: 'Dorian', start_date: Time.now - 1.years, management: true)
    end
    let!(:participant_2) do
      create(:participant, name: 'August', start_date: Time.now - 27.years, management: false)
    end

    it 'is expected to return a similarity score that is small' do
      expect(SimilarityService.cosine_similarity([participant_1, participant_2])).to be_within(0.1).of(0.1)
    end
  end
end
