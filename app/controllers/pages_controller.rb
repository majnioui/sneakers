class PagesController < ApplicationController
  def home
    @products = Product.all
    @order_item = current_order.order_items.new if current_order
    @categories = Category.all
  end
end
