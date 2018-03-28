class AddTypeToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :type, foreign_key: true
  end
end
