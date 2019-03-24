# app/assets/javascripts/cable/subscriptions/web_notifications.coffee
# Client-side which assumes you've already requested
# the right to send web notifications.
App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    new Notification data["title"], body: data["body"]


# Somewhere in your app this is called, perhaps from a NewCommentJob
WebNotificationsChannel.broadcast_to(
  current_user,
  title: 'New things!',
  body: 'All the news fit to print'
)