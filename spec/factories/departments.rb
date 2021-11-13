FactoryBot.define do
  factory :department do
    name { Faker::Job.field }
  end
end
