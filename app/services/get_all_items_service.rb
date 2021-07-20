# frozen_string_literal: true

# GetAllItemsService
class GetAllItemsService
  def initialize(keyword = nil)
    @keyword = keyword
  end

  def execute
    result = Item.all
    result = result.where('name like ?', "%#{@keyword}%") if @keyword.present?
    result = result.order(:type, :name).group_by(&:type)

    [result[CoffeeItem.to_s], result[DessertItem.to_s], result[FoodItem.to_s]]
  end
end
