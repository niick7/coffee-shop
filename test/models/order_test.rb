# == Schema Information
#
# Table name: orders
#
#  id              :bigint           not null, primary key
#  browser         :string(255)      not null
#  discount_amount :decimal(10, 2)   default(0.0)
#  platform        :string(255)      not null
#  sub_total       :decimal(10, 2)   not null
#  total           :decimal(10, 2)   not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_orders_on_browser   (browser)
#  index_orders_on_platform  (platform)
#  index_orders_on_total     (total)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
