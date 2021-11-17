FactoryBot.define do
  factory :fika do
    start_date { '2017-01-25T09:00:00.000Z' }
    end_date { '2017-01-25T09:30:00.000Z' }
    similarity { 0.5 }
    fika_score { [5, 5] }

    before(:create) do |fika|
      participants = []
      2.times { participants << create(:participant) }
      fika.participants = participants
    end
  end
end
