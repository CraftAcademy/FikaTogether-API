FactoryBot.define do
  factory :fika_goer do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    start_date { Faker::Date.between(from: 5.years.ago, to: Date.today) }
    management { false }
  end
end
