class NotificationsController < ApplicationController

  def index
    @mynotifications = Notification.where(reciever_id: current_user.id, status: 1).reverse
    render :json => @mynotifications
  end

  def create
  end
  def add
    @notification = Notification.create(:body => current_user.name + " Joined your",
                                        :sender_id => current_user.id, :order_id => params[:id],
                                        :not_type => 0, :status => 1, :reciever_id => params[:sender_id])
  end
end
