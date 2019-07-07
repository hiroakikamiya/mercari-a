class RenameDeliveryType < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_type, :delivery_cost
    add_column :items, :buyer_id, :integer,foreign_key: true
    add_column :items, :seller_id, :integer,foreign_key: true
    add_column :items, :delivery_way, :integer,foreign_key: true
  end
end
