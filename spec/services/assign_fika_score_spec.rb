RSpec.describe 'AssignScoreService', type: :service do
  describe 'when the participants have a delta between their start dates of under 5 years' do
    let(:participant_1) { create(:participant, start_date: Time.now, fika_score: 0) }
    let(:participant_2) { create(:participant, start_date: Time.now - 1.years, fika_score: 0) }
    let(:fika) { create(:fika, participants: [participant_1, participant_2]) }

    it 'is expected that the fika score will be split evenly between the participants' do
      expect(fika.fika_score).to eq([5, 5])
    end

    it 'is expected that participant 1 will have a fika score of 5' do
      expect(participant_1.fika_score).to eq 5
    end
  end

  describe 'when the participants have a delta between their start dates of over 5 years' do
    let(:participant_1) { create(:participant, start_date: Time.now) }
    let(:participant_2) { create(:participant, start_date: Time.now - 6.years) }
    let(:fika) { create(:fika, participants: [participant_1, participant_2]) }

    it 'is expected that the fika score will not be split evenly' do
      expect(fika.fika_score).to eq([6, 4])
    end

    it 'is expected that participant 1 will have a fika score of 6' do
      expect(participant_1.fika_score).to eq 6
    end
  end

  describe 'when the participants have a delta between their start dates of over 10 years' do
    let(:participant_1) { create(:participant, start_date: DateTime.now) }                            #For some reason the participants we create here are not being used when
    let!(:participant_2) { create(:participant, name: 'Fraser', start_date: DateTime.now - 12.years) } #we run the assign scores service?? 
    let(:fika) { create(:fika, participants: [participant_1, participant_2]) }
    let!(:department) { create(:department, name: 'HR') }

    it 'is expected that the fika score will not be split evenly' do
      
      expect(fika.fika_score).to eq([7, 3])
    end

    it 'is expected that participant 1 will have a fika score of 7' do
      expect(participant_1.fika_score).to eq 7
    end
  end
end
