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

class Status < ApplicationRecord
    validates_presence_of :name
    has_many :transactions
    default_scope {order(:name)}
    scope :only_active, -> { where( isActive: true )}
end
