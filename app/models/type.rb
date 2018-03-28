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

class Type < ApplicationRecord
    validates_presence_of :name, :value
    has_many :transactions
    default_scope {order(:name)}
end
