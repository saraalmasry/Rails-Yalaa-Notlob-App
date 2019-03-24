class OrdersController < ApplicationController

  def new
  end

  def index
    @friend_ships = FriendShip.select("myfriend_id").where(creator_id: current_user.id)
    @friend_ships1 = FriendShip.select("creator_id").where(myfriend_id: current_user.id)
    @orders = Order.where(user_id: @friend_ships, user_id: @friend_ships1).last(10).reverse
    @myorders = Order.where(user_id: current_user.id)
  end

  def list
    @orders = Order.where(:user => current_user.id)
    # @userOrders = UserOrder.find_by_sql("select count(distinct user_orders.user_id) from user_orders where user_orders.order_id = 5")
    @userOrders= UserOrder.select("distinct user_orders.user_id").joins("INNER JOIN orders ON user_orders.order_id = 3").count
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_list_path
  end

  def create
    @order = Order.new(params[:order])
    @order.save
    redirect_to orders_list_path
  end

  def friends_data
    @friend_ships = FriendShip.select("myfriend_id").where(creator_id: current_user.id)
    @friend_ships1 = FriendShip.select("creator_id").where(myfriend_id: current_user.id)
    @orders = Order.where(user_id: @friend_ships, user_id: @friend_ships1).last(10).reverse
    render :json => @orders, :include => :user
  end

  def update
    @order=Order.find(params[:id])
    @order.update(status: 'finished')
    redirect_to orders_list_path
  end
 

private
  def order_params
    params.require(:order).permit(:meal, :restourant, :menuImg, :status, :join, :user)
  end

end
