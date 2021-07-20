# frozen_string_literal: true

# GetAllDiscountsService
class GetAllDiscountsService
  def execute
    Discount.all.includes(:first_item, :second_item)
  end
end
