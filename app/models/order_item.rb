# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id              :bigint           not null, primary key
#  amount          :decimal(10, 2)   not null
#  amount_with_tax :decimal(10, 2)   not null
#  quantity        :integer          not null
#  tax_amount      :decimal(10, 2)   default(0.0)
#  tax_rate        :decimal(2, 2)    default(0.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  item_id         :integer          not null
#  order_id        :integer          not null
#
class OrderItem < ApplicationRecord
  # Association
  belongs_to :item
  belongs_to :order

  # Validations
  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :amount, presence: true
  validates :amount_with_tax, presence: true
  validates :quantity, presence: true
end
