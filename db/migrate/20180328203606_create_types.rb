class CreateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :name
      t.boolean :isActive
      t.decimal :value
      t.boolean :isSingleAction

      t.timestamps
    end
  end
end
