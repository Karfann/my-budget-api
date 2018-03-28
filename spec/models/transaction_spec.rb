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
#  type_id     :integer
#

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:amount) }
  it { should belong_to(:account) }
  it { should belong_to(:status) }
  it { should belong_to(:category) }
  it { should belong_to(:type) }
end
