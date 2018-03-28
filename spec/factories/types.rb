# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string
#  isActive   :boolean
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
    factory :type do
        name { Faker::Name.name }
        isActive { Faker::Boolean.boolean }
        value { Faker::Number.between(-1, 1) }
    end
end
