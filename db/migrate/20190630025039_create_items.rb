class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explain, null: false
      t.integer :category, foreign_key: true
      t.integer :delivery_type, foreign_key: true
      t.integer :delivery_date, foreign_key: true
      t.integer :price, null: false
      t.integer :prefecture, foreign_key: true
      
      t.timestamps
    end
  end
end
