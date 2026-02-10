class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.integer :stock
      t.integer :stock_status

      t.timestamps
    end
  end
end
