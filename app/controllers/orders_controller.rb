class OrdersController < ApplicationController

  def index
    @orders = Order.last(10).reverse
  end

  def add
  end
  # def list
  # end
end
