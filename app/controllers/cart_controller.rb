class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def checkout
    @order_items = current_order.order_items
  end

  def complete_order
    order = Order.find_by(id: params[:order_id])
    if order
      status  = order.update(status: 'complete')
    else
      # there is no such order
      redirect_to(:action => 'checkout') and return
    end

    if status
      redirect_to order_path(order) and return
    else
      # fail to update order status
      redirect_to :action => 'checkout' and return
    end
  end
end