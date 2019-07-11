class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.string     :post_code, null: false
      t.references :prefecture, foreign_key: true
      t.string     :city, null: false
      t.string     :address
      t.string     :detail
      t.timestamps
    end
  end
end
