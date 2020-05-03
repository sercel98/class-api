FactoryBot.define do
  factory :group do
    code { Faker::Number.number(10)}
    name { Faker::Name.name }
    teacher_id nil
  end
end