class CreateFriendShips < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_ships do |t|
      t.references :creator
      t.references :myFriend

      t.timestamps
    end
  end
end
