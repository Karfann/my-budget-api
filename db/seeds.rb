Status.create!([ 
    {name: 'Cleared', isActive: Faker::Boolean.boolean}, 
    {name: 'Uncleared', isActive: Faker::Boolean.boolean},
    {name: 'Void', isActive: Faker::Boolean.boolean}
])

Category.create!([ 
    {name: 'Food & Drinks', isActive: Faker::Boolean.boolean}, 
    {name: 'Shopping', isActive: Faker::Boolean.boolean},
    {name: 'Housing', isActive: Faker::Boolean.boolean},
    {name: 'Transportation', isActive: Faker::Boolean.boolean},
    {name: 'Vehicle', isActive: Faker::Boolean.boolean},
    {name: 'Life & Entertainment', isActive: Faker::Boolean.boolean},
    {name: 'Communication, PC', isActive: Faker::Boolean.boolean},
    {name: 'Financial expenses', isActive: Faker::Boolean.boolean},
    {name: 'Investments', isActive: Faker::Boolean.boolean},
    {name: 'Income', isActive: Faker::Boolean.boolean},
    {name: 'Others', isActive: Faker::Boolean.boolean}
])

Account.create!([ 
    {name: 'Bradesco', balance: Faker::Number.decimal(2), isActive: Faker::Boolean.boolean}, 
    {name: 'Banco do Brasil', balance: Faker::Number.decimal(2), isActive: Faker::Boolean.boolean},
    {name: 'Santander', balance: Faker::Number.decimal(2), isActive: Faker::Boolean.boolean},
    {name: 'Itau', balance: Faker::Number.decimal(2), isActive: Faker::Boolean.boolean},
    {name: 'n26', balance: Faker::Number.decimal(2), isActive: Faker::Boolean.boolean},
    {name: 'Nubank', balance: Faker::Number.decimal(2), isActive: Faker::Boolean.boolean},
])

10.times do |index|
    
    Transaction.create!(
            date: Faker::Date.backward(30), 
            description: Faker::Company.name,
            note: Faker::Lorem.paragraph,
            amount: Faker::Number.decimal(2),
            account_id: Faker::Number.between(1,Account.count),
            status_id: Faker::Number.between(1,Status.count),
            category_id: Faker::Number.between(1,Category.count)
        )
end