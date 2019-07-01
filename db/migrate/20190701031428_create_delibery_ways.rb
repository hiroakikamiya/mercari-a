class CreateDeliberyWays < ActiveRecord::Migration[5.2]
  def change
    create_table :delibery_ways do |t|
      t.string :name
      t.timestamps
    end
  end
end
