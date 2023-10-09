module Home
	class Index < Integrations::Paginator

		def index
			followings = user.followings.pluck('id')
			followings.push(user.id)
			Tweet.includes(:user).where({user_id: followings})
		end

		private

		delegate :user, to: :context

	end
end