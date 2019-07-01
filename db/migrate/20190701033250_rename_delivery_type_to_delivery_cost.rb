class RenameDeliveryTypeToDeliveryCost < ActiveRecord::Migration[5.2]
  def change
    rename_table :delivery_types, :delivery_costs
  end
end
