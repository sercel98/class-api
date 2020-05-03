FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    age { Faker::Number.number(10) }
    group_id nil
  end
end