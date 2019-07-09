class CreateDeliveryCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_costs do |t|
      t.string     :cost
      t.timestamps
    end
  end
end
