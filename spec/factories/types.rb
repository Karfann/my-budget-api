FactoryBot.define do
    factory :type do
        name { Faker::Name.name }
        isActive { Faker::Boolean.boolean }
        value { Faker::Number.between(-1, 1) }
        isSingleAction { Faker::Boolean.boolean }
    end
end