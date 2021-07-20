# frozen_string_literal: true

# GetDiscountsByCartService
class GetDiscountsByCartService
  include ActionView::Helpers::NumberHelper

  def initialize(item_id, available_item_ids)
    @item_id = item_id
    @available_item_ids = available_item_ids
  end

  def execute
    Discount.where(
      '(first_item_id = ? and second_item_id IN (?)) or (first_item_id IN (?) and second_item_id = ?)',
      @item_id, @available_item_ids, @available_item_ids, @item_id
    )
  end
end
