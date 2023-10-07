module Api
	module ResponseHelper

		def response_with_interactor(interactor:, params:, serializer:)
			interactor = interactor.call(params)
			return render_error(interactor.error) if interactor.failure?

			render_success(interactor.result, :ok, serializer)
		end

		def response_with_message(interactor:, params:, message:)
			interactor = interactor.call(params)
			return render_error(interactor.error) if interactor.failure?
			
			render json: {message:}, status: :ok
		end

		def render_error(error)
			render json: {error:}, status: error.status
		end

		def render_success(result, status, serializer)
			render json: result, status:, serializer:
		end

	end
end