# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  isActive   :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe Status, type: :model do
  it { should validate_presence_of(:name)}
  it { should have_many(:transactions) }
end
