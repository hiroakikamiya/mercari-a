class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,           null: false
      t.string     :explain,        null: false
      t.bigint     :category_id
      t.bigint     :delivery_cost_id
      t.bigint     :delivery_date_id
      t.bigint     :delivery_way_id
      t.bigint     :prefecture_id
      t.bigint     :status_id
      t.integer    :price,          null: false
      t.bigint     :buyer_id
      t.bigint     :seller_id
      t.timestamps 
    end
    add_foreign_key :items, :categories, column: :category_id
    add_foreign_key :items, :delivery_costs, column: :delivery_cost_id
    add_foreign_key :items, :delivery_dates, column: :delivery_date_id
    add_foreign_key :items, :delivery_ways, column: :delivery_way_id
    add_foreign_key :items, :prefectures, column: :prefecture_id
    add_foreign_key :items, :statuses, column: :status_id
    add_foreign_key :items, :users, column: :buyer_id
    add_foreign_key :items, :users, column: :seller_id
  end
end
