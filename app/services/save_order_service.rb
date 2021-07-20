# frozen_string_literal: true

# GetAllItemsService
class SaveOrderService
  def initialize(items, total, sub_total, discount_amount, session_cart, browser)
    @items = items
    @total = total
    @sub_total = sub_total
    @discount_amount = discount_amount
    @session_cart = session_cart
    @browser = browser
  end

  def execute
    order = Order.create!(
      browser: @browser.name, platform: @browser.platform.name,
      total: @total, sub_total: @sub_total, discount_amount: @discount_amount
    )
    @items.each do |item|
      amount = item.amount
      tax_rate = item.tax_rate
      order.order_items.create!(
        item_id: item.id, amount: item.amount, tax_rate: item.tax_rate,
        tax_amount: amount * tax_rate, amount_with_tax: item.amount * (1 + tax_rate),
        quantity: @session_cart[item.id.to_s].to_i
      )
    end
  end
end
