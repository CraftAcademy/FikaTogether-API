FactoryBot.define do
  factory :fika do
    start_date { "2017-01-25T09:00:00.000Z" }
    end_date { "2017-01-25T09:30:00.000Z" }
    similarity { 0.5 }
  end
end
