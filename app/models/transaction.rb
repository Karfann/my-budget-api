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
#

class Transaction < ApplicationRecord
    validates_presence_of :date, :description, :amount
    belongs_to :account
    belongs_to :status
    belongs_to :category
    default_scope {order(:date)}
end
