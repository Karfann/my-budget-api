class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :balance
      t.boolean :isActive

      t.timestamps
    end
  end
end
