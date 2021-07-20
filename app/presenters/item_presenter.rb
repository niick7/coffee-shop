# frozen_string_literal: true

# ItemPresenter
class ItemPresenter
  include ActionView::Helpers::NumberHelper

  def initialize(item)
    @item = item
  end

  def id
    @item.id
  end

  def name
    @item.name
  end

  def uppercase_name
    name.upcase
  end

  def amount
    number_with_precision(@item.amount, precision: 2)
  end

  def tax_rate
    @item.tax_rate
  end

  def amount_with_tax
    number_with_precision(@item.amount * (1 + tax_rate), precision: 2)
  end

  def tax_rate_in_amount
    @item.tax_rate * amount
  end

  def tax_rate_in_amount_with_currency
    "$#{tax_rate_in_amount}"
  end

  def amount_with_currency
    "$#{amount}"
  end

  def amount_with_tax_and_currency
    "$#{amount_with_tax}"
  end
end
