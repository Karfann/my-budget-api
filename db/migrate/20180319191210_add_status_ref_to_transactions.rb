class AddStatusRefToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :status, foreign_key: true
  end
end
