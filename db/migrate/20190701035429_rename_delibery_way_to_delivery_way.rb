class RenameDeliberyWayToDeliveryWay < ActiveRecord::Migration[5.2]
  def change
    rename_table :delibery_ways, :delivery_ways
  end
end
