class GroupMemberController < ApplicationController
  def create
    @groupMemberID = User.where(name: "sara").select(:id)
    @groupMember = GroupMember.new(group_id: params[:id] , user_id: @groupMemberID)
    @groupMember.save
    redirect_to groups_path(@groupMember)
  end
end
