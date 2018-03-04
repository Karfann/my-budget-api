class ChangeColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :accounts, :isActive, true
  end
end
