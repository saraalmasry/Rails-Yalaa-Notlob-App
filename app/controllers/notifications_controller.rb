class NotificationsController < ApplicationController

  def index
    @mynotifications = Notification.where(reciever_id: current_user.id, status: 1).reverse
    render :json => @mynotifications
  end

  def join
    users = User.all
    mynotifications = Notification.where(not_type: 0, order_id: params[:id]).reverse
    @joined_friends = []
    mynotifications.each do |note|
      @joined_friends.append(users.find(note.sender_id))
    end
    render :json => @joined_friends #, :include => {:sender => {to_table: users}}
  end

  def create
  end
  def add
    @notification = Notification.create(:body => current_user.name + " Joined your",
                                        :sender_id => current_user.id, :order_id => params[:id],
                                        :not_type => 0, :status => 1, :reciever_id => params[:sender_id])
  end


  def mark
    @notifications=Notification.where(reciever_id: current_user.id, status: 1);
    @notifications.update_all(:status => 0);
    redirect_to orders_list_path
  end


  def list
    @notification = Notification.where(:reciever_id => current_user.id)
  end
end
