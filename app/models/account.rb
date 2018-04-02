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

class Account < ApplicationRecord
    validates_presence_of :name, :balance
    has_many :transactions
    default_scope {order(:name)}
    scope :only_active, -> { where( isActive: true )}
end
