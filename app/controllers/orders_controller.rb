class OrdersController < ApplicationController

  def index
    @orders = Order.last(10).reverse
    @myorders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def add
  end

  def list
  end
end
