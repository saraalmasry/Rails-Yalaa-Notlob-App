class User < ApplicationRecord
  has_many :created_friend_ships , :class_name => 'FriendShip' , :foreign_key => 'creator_id'
  has_many :myFriend_friend_ships , :class_name => 'FriendShip' , :foreign_key => 'myFriend_id'
end
