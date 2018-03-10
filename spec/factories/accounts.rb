# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  balance    :decimal(, )
#  isActive   :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
    factory :account do
        name { Faker::Name.name }
        balance { Faker::Number.number(10) }
        isActive true
    end
end
