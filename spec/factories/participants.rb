FactoryBot.define do
  factory :participant do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    start_date { Faker::Date.between(from: 15.years.ago, to: Date.today) }
    management { Faker::Boolean.boolean }
    department
    seniority { Faker::Number.between(from: 1, to: 5) }
    fika_score { 0 }
  end
end
