class GroupsUserController < ApplicationController

    def checkFriend(friendId)
        @ch = FriendShip.where("creator_id = ? AND myfriend_id =  ?" ,current_user.id , friendId).or(FriendShip.where("creator_id = ? AND myfriend_id =  ?"  , friendId , current_user.id))
    end

    def create
        @groupId = group_member_params[:group_id]
        @user = User.where(email: group_member_params[:email]).pluck("id")[0]

    if checkFriend(@user).exists?
        @addFriend = GroupsUser.new(group_id: @groupId , user_id: @user )
        @addFriend.save
        flash[:success] = "Friend Added To Your Group "
      else
 flash[:danger] = " Sorry but you haven't any Friends with this email "
      end
      redirect_to groups_path

    end

    private

def group_member_params
  params.require(:group_member).permit(:email , :group_id)
end
end
