# frozen_string_literal: true

# CreateItems
class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.decimal :tax_rate, precision: 2, scale: 2, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false

      # Define indexes
      t.index :name

      t.timestamps
    end
  end
end
