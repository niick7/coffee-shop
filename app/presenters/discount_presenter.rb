# frozen_string_literal: true

# DiscountPresenter
class DiscountPresenter
  include ActionView::Helpers::NumberHelper

  @delegated_methods = %i[id]
  @delegated_methods.each do |method|
    define_method(method) do
      return @discount.try(method) if @discount.respond_to?(method)

      nil
    end
  end

  def initialize(discount)
    @discount = discount
  end

  def first_item
    @discount.first_item
  end

  def first_item_name
    first_item.name
  end

  def uppercase_first_item_name
    first_item_name.upcase
  end

  def second_item
    @discount.second_item
  end

  def uppercase_second_item_name
    second_item_name.upcase
  end

  def second_item_name
    second_item.name
  end

  def total_discount_amount
    number_with_precision(
      first_item.amount * @discount.first_item_discount_rate + second_item.amount * @discount.second_item_discount_rate,
      precision: 2
    )
  end

  def total_discount_amount_with_currency
    "$#{total_discount_amount}"
  end

  delegate :id, to: '@discount'
end
