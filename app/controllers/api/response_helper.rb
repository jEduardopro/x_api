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

		def response_with_data(interactor:, params:)
			interactor = interactor.call(params)
			return render_error(interactor.error) if interactor.failure?

			render json: interactor.result, status: :ok
		end

		def response_with_collection(interactor:, params:, serializer:)
			interactor = interactor.call(params)
			return render_error(interactor.error) if interactor.failure?

			data = collection_serializer(interactor, serializer)			
			render json: data, status: :ok
		end

		def collection_serializer(interactor, serializer)
			{
				data: interactor.result[:collection].map { |record| serializer.new(record) },
				page: interactor.result[:page].to_i,
				per_page: interactor.result[:per_page].to_i,				
				total_pages: interactor.result[:total_pages],
				next_page: interactor.result[:next_page]
			}
		end		

		def render_error(error)
			render json: {error:}, status: error.status
		end

		def render_success(result, status, serializer)
			render json: result, status:, serializer:
		end

	end
end