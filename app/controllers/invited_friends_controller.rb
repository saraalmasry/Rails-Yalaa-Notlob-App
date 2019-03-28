class InvitedFriendsController < ApplicationController

  def create

  end

  def update

  end

  def destroy
    invited_friend = InvitedFriend.find(params[:id])
    order = Order.find(invited_friend.order_id)
    notification = Notification.where(order_id: order.id, reciever_id: invited_friend.user_id, not_type: 1)
    notification.destroy_all
    order.decrement(:invited)
    order.save
    invited_friend.destroy
    redirect_to order_path(order)
  end

end
