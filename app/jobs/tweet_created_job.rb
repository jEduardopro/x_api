class TweetCreatedJob < ApplicationJob
  queue_as :tweets

  def perform(id)
    p 'from tweet created job'
  end
end
