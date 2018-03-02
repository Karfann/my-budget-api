FactoryBot.define do
    factory :account do
        name { Faker::Name.name }
        balance { Faker::Number.number(10) }
        isActive true
    end
end