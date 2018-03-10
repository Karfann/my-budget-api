class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string :description
      t.text :note
      t.decimal :amount

      t.timestamps
    end
  end
end
