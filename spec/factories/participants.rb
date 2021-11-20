FactoryBot.define do
  factory :participant do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    start_date { Faker::Date.between(from: 15.years.ago, to: Date.today) }
    management { Faker::Boolean.boolean }
    department
    seniority { Faker::Number.between(from: 1, to: 5) }
    fika_score { 0 }
    after(:build) do |participant|
      participant.avatar.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'images', 'test.png')),
                                filename: 'test.png', content_type: 'image/png')
    end
  end
end
