class OrdersController < ApplicationController

  def index
    @orders = Order.last(10).reverse
    @myorders = Order.where(user_id: current_user.id)
  end

  def friends_data
    @orders = Order.last(10).reverse
    render :json => @orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def add
  end

  def list
  end
end
