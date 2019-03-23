class GroupsUserController < ApplicationController
    def create
        @groupId = group_member_params[:group_id]
        @group = Group.where(id: 26)
        @user = User.where(email: group_member_params[:email]).pluck("id")[0]
        # @group.users.create(@user)
        @a = GroupsUser.new(group_id: @groupId , user_id: @user )
       @a.save
      redirect_to groups_path 
    end

    private

def group_member_params
  params.require(:group_member).permit(:email , :group_id)
end
end
