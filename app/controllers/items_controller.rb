# frozen_string_literal: true

# ItemsController
class ItemsController < ApplicationController
  before_action :set_item, only: %i[add_item_to_cart]

  def index
    @coffees, @desserts, @foods = GetAllItemsService.new(params[:q]).execute
  end

  def add_item_to_cart
    set_session_item_cart
    set_session_discount_after_create_cart

    redirect_back(fallback_location: root_path)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_session_item_cart
    session[:cart][@item.id.to_s].present? ? session[:cart][@item.id.to_s] += 1 : session[:cart][@item.id.to_s] = 1
  end

  def set_session_discount_after_create_cart
    item_id = @item.id
    item_discounts = GetDiscountsByCartService.new(item_id, session[:available_item_ids]).execute

    if item_discounts.empty?
      session[:available_item_ids] << item_id
    else
      discount = item_discounts[0]
      session[:discount_ids] << discount.id
      target_item_id = discount.first_item_id
      target_item_id = discount.second_item_id if discount.first_item_id == item_id
      session[:available_item_ids].delete_at(session[:available_item_ids].index(target_item_id))
    end
  end
end
