FactoryBot.define do
    factory :status, aliases: [:isActive_status] do
        name { Faker::Name.name}
        isActive true
    end
end