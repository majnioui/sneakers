class OrderItemsController < ApplicationController
  before_action :set_order
  skip_before_action :verify_authenticity_token
  def create
    # @order_item = @order.order_items.new(order_params)
    # @order.save
    # if there is line-item match new order item
    # => change quantiy
    # else
    # => create
    line_item = @order.order_items.find_by(product_id: order_params[:product_id])
    if line_item
      line_item.quantity += order_params[:quantity].to_i
      line_item.save
    else
      line_item = @order.order_items.create(order_params)
    end
    redirect_to product_path(order_params[:product_id])
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
