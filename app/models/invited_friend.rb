class InvitedFriend < ApplicationRecord
  belongs_to :order
  belongs_to :user
end
