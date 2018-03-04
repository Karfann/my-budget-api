# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Account.create!([
    {name: 'Bank of Ireland', balance: 50.00, isActive: true},
    {name: 'AIB', balance: 0.00, isActive: true},
    {name: 'Bank of Brazil', balance: 0.00, isActive: false},
    {name: 'N26', balance: -150.00, isActive: true},
    {name: 'Ulster', balance: 0.00, isActive: false}
])