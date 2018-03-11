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

require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:balance) }
  it { should have_many(:transactions) }
end
