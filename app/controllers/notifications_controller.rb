class NotificationsController < ApplicationController

  def index
    @mynotifications = Notification.where(reciever_id: current_user.id, status: 1).reverse
    render :json => @mynotifications
  end

  def join
    users = User.all
    myjoinedFriends = InvitedFriend.where(order_id: params[:id], acceptStatus: "joined")
    @joined_friends = []
    myjoinedFriends.each do |myjoinedFriend|
      @joined_friends.append(users.find(myjoinedFriend.user_id))
    end
    render :json => @joined_friends
  end

  def create
  end
  def add
    @notification = Notification.create(:body => current_user.name + " Joined your",
                                        :sender_id => current_user.id, :order_id => params[:id],
                                        :not_type => 0, :status => 1, :reciever_id => params[:sender_id])

    joined_friend = InvitedFriend.where(:order_id => params[:id], :user_id => current_user.id)
    joined_friend.update(acceptStatus: "joined")

    joined_friends = InvitedFriend.where(:order_id => params[:id], :acceptStatus => "joined").count

    order = Order.find(params[:id])
    if(order.joined < joined_friends)
      order.increment(:joined)
      order.save
    end
  end


  def mark
    @notifications=Notification.where(reciever_id: current_user.id, status: 1);
    @notifications.update_all(:status => 0);
    redirect_to orders_list_path
  end


  def list
    @notification = Notification.where(:reciever_id => current_user.id).reverse.paginate(page: params[:page], per_page: 5)
  end
end
