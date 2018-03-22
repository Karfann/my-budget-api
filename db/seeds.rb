# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create!([ 
    {name: 'Cleared', isActive: true}, 
    {name: 'Uncleared', isActive: true},
    {name: 'Void', isActive: false}
])

3.times do 
    Account.create!(
        name: Faker::Bank.name, 
        balance: Faker::Number.decimal(2), 
        isActive: Faker::Boolean.boolean
    )
end

10.times do |index|
    
    Transaction.create!(
            date: Faker::Date.backward(30), 
            description: Faker::Company.name,
            note: Faker::Lorem.paragraph,
            amount: Faker::Number.decimal(2),
            account_id: Faker::Number.between(1,Account.count),
            status_id: Faker::Number.between(1,Status.count)
        )
end