class FriendShip < ApplicationRecord
  belongs_to :creator , :class_name => 'User'
  belongs_to :myFriend , :class_name => 'User'
end
