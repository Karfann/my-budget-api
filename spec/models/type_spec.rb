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

require 'rails_helper'

RSpec.describe Type, type: :model do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:value)}
  it { should have_many(:transactions) }
end
