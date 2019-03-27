class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :mail
      t.string :restourant
      t.string :menuImg
      t.string :status
      t.integer :join
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
