class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :bio
end
