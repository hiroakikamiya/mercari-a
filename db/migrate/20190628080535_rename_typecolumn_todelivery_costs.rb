class RenameTypecolumnTodeliveryCosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :delivery_costs, :type, :cost
  end
end
