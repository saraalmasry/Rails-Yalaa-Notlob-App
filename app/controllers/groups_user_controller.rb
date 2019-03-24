class GroupsUserController < ApplicationController
    
    def checkFriend(friendId)
        @ch = FriendShip.where(creator_id:current_user.id).where(myfriend_id: friendId) 
        if !@ch.exists? 
       flash[:danger] = " Sorry but you haven't any Friends with this email "
      redirect_to groups_path 
        end
    end

    def create
        @groupId = group_member_params[:group_id]        
        @user = User.where(email: group_member_params[:email]).pluck("id")[0]
        checkFriend(@user)
        @addFriend = GroupsUser.new(group_id: @groupId , user_id: @user )
      if @addFriend.save
        flash[:success] = "Friend Added To Your Group "
      redirect_to groups_path 
      end
    end

    private

def group_member_params
  params.require(:group_member).permit(:email , :group_id)
end
end
