class UserOrdersController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @user_order = @order.user_orders.create(user_order_params)
    redirect_to order_path(@order)
  end

  private
  def user_order_params
    params.require(:user_order).permit(:item, :amount, :price, :comment, :order_id, :user_id)
  end
end
