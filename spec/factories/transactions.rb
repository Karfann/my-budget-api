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
#  account_id  :integer
#  status_id   :integer
#  category_id :integer
#

FactoryBot.define do
    factory :transaction do
        date { Faker::Date.backward(30) }
        description { Faker::Company.name }
        note { Faker::Lorem.paragraph }
        amount { Faker::Number.decimal(2) }
        association :account
        association :status
        association :category
    end
end
