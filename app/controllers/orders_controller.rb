class OrdersController < ApplicationController
def new
end


def list
    @orders = Order.where(:user => '1')
    # @userOrders = UserOrder.find_by_sql("select count(distinct user_orders.user_id) from user_orders where user_orders.order_id = 5")
    @userOrders= UserOrder.select("distinct user_orders.user_id").joins("INNER JOIN orders ON user_orders.order_id = 3").count
end

def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to :back
    
  end
  

def create 
    @orders = Order.new(order_params)
 
    @orders.save
    redirect_to @order
     
end

private
  def order_params
    params.require(:orders).permit(:meal, :restourant, :menuImg, :status, :join, :user)
  end


  def index
    @orders = Order.last(10).reverse
    @myorders = Order.where(user_id: current_user.id)
  end

  def friends_data
    @orders = Order.last(10).reverse
    render :json => @orders
  end

end
