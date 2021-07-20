# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  before_action :set_session_cart, :set_session_discount, :set_discount, :set_session_available_items_for_discounting

  private

  def set_session_cart
    session[:cart] ||= {}
  end

  def set_session_discount
    session[:discount_ids] ||= []
  end

  def set_session_available_items_for_discounting
    session[:available_item_ids] ||= []
  end

  def set_discount
    @discounts = GetAllDiscountsService.new.execute
  end

  def reset_session
    session[:cart] = {}
    session[:discount_ids] = []
    session[:available_item_ids] = []
  end
end
