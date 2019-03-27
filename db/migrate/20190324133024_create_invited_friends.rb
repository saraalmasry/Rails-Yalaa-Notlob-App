class CreateInvitedFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :invited_friends do |t|
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.string :acceptStatus

      t.timestamps
    end
  end
end
