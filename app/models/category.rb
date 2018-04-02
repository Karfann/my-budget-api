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

class Category < ApplicationRecord
    validates_presence_of :name
    has_many :transactions
    default_scope {order(:name)}
    scope :only_active, -> { where( isActive: true )}
end
