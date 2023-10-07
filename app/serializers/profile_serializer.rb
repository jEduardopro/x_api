class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email,

	def id
		object.uuid
	end
end
