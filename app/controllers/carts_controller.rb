# frozen_string_literal: true

# require 'browser'

# CartsController
class CartsController < ApplicationController
  before_action :load_index, only: %i[index checkout]

  def index; end

  def clear_cart
    reset_session
    redirect_to root_path, notice: 'Cleared cart successfully!'
  end

  def checkout
    ActiveRecord::Base.transaction do
      SaveOrderService.new(@items, @total, @sub_total, @discount_amount, session[:cart], browser).execute
      reset_session
      redirect_to root_path, notice: 'Thank you for shopping at the Coffee Shop!'
    end
  rescue StandardError => e
    p "Checkout error: #{e}"
    redirect_to root_path, notice: 'Checked out cart error!'
  end

  private

  def load_index
    @items = Item.by_ids(session[:cart].keys)
    @sub_total, @discount_amount, @total = GetAllItemsCartPriceService.new(
      @items, session[:discount_ids], session[:cart]
    ).execute
  end
end
