FactoryBot.define do
    factory :status do
        name { Faker::Name.name}
        isActive true
    end
end