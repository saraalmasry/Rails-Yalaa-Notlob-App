class FriendShip < ApplicationRecord
  #belongs_to :user

  # acts_as_notifiable :users,
  # Notification targets as :targets is a necessary option
  # Set to notify to author and users commented to the article, except comment owner self
  # targets: ->(friend_ship, key) {
  #  ([friend_ship.myfriend]).uniq
  # },
  # tracked: true
  # Path to move when the notification is opened by the target user
  # This is an optional configuration since activity_notification uses polymorphic_path as default
  # notifiable_path: :article_notifiable_path
  #
  # def article_notifiable_path
  #   article_path(article)
  # end
end
