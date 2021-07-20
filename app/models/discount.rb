# frozen_string_literal: true

# == Schema Information
#
# Table name: discounts
#
#  id                        :bigint           not null, primary key
#  first_item_discount_rate  :decimal(2, 2)    not null
#  second_item_discount_rate :decimal(2, 2)    not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  first_item_id             :integer          not null
#  second_item_id            :integer          not null
#
# Indexes
#
#  index_discounts_on_first_item_id   (first_item_id)
#  index_discounts_on_second_item_id  (second_item_id)
#
class Discount < ApplicationRecord
  # Scope
  scope :by_ids, ->(ids) { where(id: ids) }

  # Associations
  belongs_to :first_item, class_name: 'Item'
  belongs_to :second_item, class_name: 'Item'

  # Validations
  validates :first_item_id, presence: true, uniqueness: { scope: :second_item_id }
  validates :second_item_id, presence: true
  validates :first_item_discount_rate, presence: true, inclusion: { in: 0..1 }
  validates :second_item_discount_rate, presence: true, inclusion: { in: 0..1 }

  # TODO: caches this table, expires caches when updating and deleting
end
