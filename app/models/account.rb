# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  balance    :decimal(, )
#  isActive   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord
    validates_presence_of :name, :balance, :isActive
end
