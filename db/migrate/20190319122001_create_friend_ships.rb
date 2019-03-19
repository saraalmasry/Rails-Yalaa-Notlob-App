class CreateFriendShips < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_ships do |t|
      t.references :creator, foreign_key: {to_table: :users}
      t.references :myfriend, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
