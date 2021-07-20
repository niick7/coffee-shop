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
class FoodItem < Item
end
