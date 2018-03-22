class AddIsActiveToStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :isActive, :boolean
    change_column_default :statuses, :isActive, true
  end
end
