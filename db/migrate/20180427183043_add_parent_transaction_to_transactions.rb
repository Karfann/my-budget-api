class AddParentTransactionToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :parent_transaction, :integer
  end
end
