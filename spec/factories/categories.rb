# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  isActive   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
    factory :category do
        name { Faker::Name.name}
        isActive true
    end
end
