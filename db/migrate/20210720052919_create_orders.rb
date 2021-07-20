# frozen_string_literal: true

# CreateOrders
class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :browser, null: false
      t.string :platform, null: false
      t.decimal :total, precision: 10, scale: 2, null: false
      t.decimal :sub_total, precision: 10, scale: 2, null: false
      t.decimal :discount_amount, precision: 10, scale: 2, default: 0

      t.index :browser
      t.index :platform
      t.index :total

      t.timestamps
    end
  end
end
