class PusherNotificationJob < ApplicationJob
	queue_as :tweets

  def perform(channel, event, data)
		Pusher.trigger(channel, event, data)
  end
end
