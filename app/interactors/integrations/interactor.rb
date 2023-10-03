module Integrations
	module Interactor
		def self.included(mod)
			mod.include(::Interactor)
		end

		def add_bad_request_error!(error)
			context.fail!(error: Application::BadRequest.new(error))
		end

		def add_resource_not_found_error(error)
			context.fail!(error: Application::ResourceNotFound.new(error))
		end

		def add_unprocessable_entity_error(error)
			context.fail!(error: Application::UnprocessableEntity.new(error))
		end

		def set_result(result)
			set_application_record_key(result) if result.is_a?(ApplicationRecord)
			context.result = result
		end


		private 

		def set_application_record_key(result)
			context.send("#{result.class.name.downcase}=", result)
		end

	end
end