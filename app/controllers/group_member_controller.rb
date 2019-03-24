class GroupMemberController < ApplicationController
  def create
    @group = Group.find(params[:id])
    @user = User.where(name: "sara").select(:id)
    @groupMember = GroupsUser.new(group_id: params[:id] , user_id: @groupMemberID)
    @groupMember.save

    redirect_to groups_path 
  end

  def show 
  end
  private
  def group_member_params
    params.require(:group).permit(:name)
  end
end
