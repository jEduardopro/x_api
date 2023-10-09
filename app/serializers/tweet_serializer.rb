class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at

	belongs_to :user

	def id
		object.uuid
	end

end
