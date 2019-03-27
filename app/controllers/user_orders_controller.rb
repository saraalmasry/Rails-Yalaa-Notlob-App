class UserOrdersController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @user_order = @order.user_orders.create(user_order_params)
    redirect_to order_path(@order)
  end

  def destroy
    @userOrder = UserOrder.find(params[:id])
    order_id = @userOrder.order_id
    @userOrder.destroy
    redirect_to order_path(Order.find(order_id))

  end

  private
  def user_order_params
    params.require(:user_order).permit(:item, :amount, :price, :comment, :order_id, :user_id)
  end
end
