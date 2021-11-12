FactoryBot.define do
  factory :participant do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    start_date { Faker::Date.between(from: 5.years.ago, to: Date.today) }
    management { Faker::Boolean.boolean }
    department
    seniority { 2 }
  end
end
