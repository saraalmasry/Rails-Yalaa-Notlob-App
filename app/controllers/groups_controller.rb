class GroupsController < ApplicationController

  def index
    @groups = Group.where(user_id: current_user.id)

    if params.has_key?(:id)
      @groupId  = params[:id]
    else
  @groupId = Group.where(user_id: current_user.id).pluck("id").first

    end


    # if params.has_key?(:id)
      @groupDetail = Group.find(@groupId)
    # else
      # @groupDetail = Group.where(user_id: current_user.id).first

    # end
      @membersIds = GroupsUser.where(group_id: @groupId).select(:user_id)
       @members = User.where(id: @membersIds )
    end

def create

  @group = Group.new(group_params.merge(user_id: current_user.id))
  @group.save

  redirect_to groups_path
  # @groupMemberID = User.where(name: group_params[:name]).select(:id)
  # @groupMember = GroupMember.new(group_id: @groupId , user_id: @groupMemberID)
  # @groupMember.save
end

def destroy
  @group = Group.find(@groupId)
   @group.destroy
   redirect_to groups_path
end



  private
  def group_params
    params.require(:group).permit(:name)
  end


end
