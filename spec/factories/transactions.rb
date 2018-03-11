# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  date        :datetime
#  description :string
#  note        :text
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
    factory :transaction do
        date { Faker::Date.backward(30) }
        description { Faker::Company.name }
        note { Faker::Lorem.paragraph }
        amount { Faker::Number.decimal(2) }
        association :account
    end
end