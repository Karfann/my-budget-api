class RemoveIsSingleActionFromType < ActiveRecord::Migration[5.1]
  def change
    remove_column :types, :isSingleAction, :boolean
  end
end
