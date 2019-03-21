class AddResetPasswordSentAt < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reset_password_sent_at, :DATETIME
  end
end
