class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.decimal :tax_amount, precision: 10, scale: 2, default: 0
      t.decimal :tax_rate, precision: 2, scale: 2, default: 0
      t.decimal :amount_with_tax, precision: 10, scale: 2, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
