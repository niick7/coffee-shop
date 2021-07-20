# frozen_string_literal: true

# CreateDiscounts
class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.integer :first_item_id, null: false
      t.integer :second_item_id, null: false
      t.decimal :first_item_discount_rate, precision: 2, scale: 2, null: false
      t.decimal :second_item_discount_rate, precision: 2, scale: 2, null: false

      # Define indexes
      t.index :first_item_id
      t.index :second_item_id

      t.timestamps
    end
  end
end
