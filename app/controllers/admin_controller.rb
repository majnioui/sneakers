class AdminController < ApplicationController
  before_action :admin_required

  def index
  end

  def orders
    @orders = Order.where(status: 'complete')
    render 'orders'
  end

  def order
    @order = Order.find_by(id: params[:order_id], status: 'complete')
    if !@order
      redirect_to admin_path
    end
  end
end
