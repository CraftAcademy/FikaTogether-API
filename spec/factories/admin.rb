FactoryBot.define do
  factory :admin do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { 'password' }
  end
end
