class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :body
      t.references :order, foreign_key: true
      t.integer :not_type
      t.integer :status
      t.references :sender, foreign_key: {to_table: :users}
      t.references :reciever, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
