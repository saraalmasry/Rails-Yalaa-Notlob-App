class NotificationsController < ApplicationController

  def index
    @mynotifications = Notification.where(user_id: current_user.id)
    render :json => @mynotifications
  end

  def create
  end

end
