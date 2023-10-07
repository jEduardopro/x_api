class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

	def id
		object.uuid
	end
end
