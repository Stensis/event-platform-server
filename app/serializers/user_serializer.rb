class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :username, :email, :role, :profilepicture, :tel
end
