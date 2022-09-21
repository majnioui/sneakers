class OrdersController < ApplicationController
    before_action :authenticate_user! #-> routes to the login / signup if not authenticated


    def show
      @order = current_user.orders.find_by(id: params[:id], status: 'complete')
      if !@order
        redirect_to root_path
      end
    end

    
    def index
      @orders = current_user.orders.where(status: 'complete')
    end
  

  end
