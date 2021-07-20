# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  amount     :decimal(10, 2)   not null
#  name       :string(255)
#  tax_rate   :decimal(2, 2)    not null
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_items_on_name  (name)
#
class Item < ApplicationRecord
  # Scope
  scope :by_ids, ->(ids) { where(id: ids) }

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true, inclusion: { in: %w[CoffeeItem FoodItem DessertItem] }
  validates :amount, presence: true
  validates :tax_rate, presence: true, inclusion: { in: 0..1 }
end
