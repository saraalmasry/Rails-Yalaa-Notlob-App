class FriendShipController < ApplicationController
  def Friends
  end

  def addFriend
    redirect_to groups_path 
    render plain: params[:user].inspect
  end  
end
