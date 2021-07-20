# frozen_string_literal: true

# GetAllItemsCartPriceService
class GetAllItemsCartPriceService
  include ActionView::Helpers::NumberHelper

  def initialize(items, discount_ids, sesison_cart)
    @items = items
    @discount_ids = discount_ids
    @sesison_cart = sesison_cart
  end

  def execute
    [calculate_sub_total, calculate_discount_amount, calculate_total]
  end

  def calculate_sub_total
    amount = 0
    @items.each do |item|
      amount += item.amount * (1 + item.tax_rate) * @sesison_cart[item.id.to_s].to_i
    end
    number_with_precision(amount, precision: 2)
  end

  def calculate_discount_amount
    amount = 0
    unless @discount_ids.empty?
      discounts = Discount.includes(:first_item, :second_item).by_ids(@discount_ids)
      discounts.each do |discount|
        amount += discount.first_item_discount_rate * discount.first_item.amount
        amount += discount.second_item_discount_rate * discount.second_item.amount
      end
    end
    number_with_precision(amount, precision: 2)
  end

  def calculate_total
    number_with_precision(calculate_sub_total.to_d - calculate_discount_amount.to_d, precision: 2)
  end
end
