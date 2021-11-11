FactoryBot.define do
  factory :department do
    name { Faker::Job.field }
    average_score { 1 }
  end
end
