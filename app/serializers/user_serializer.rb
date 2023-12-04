class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :email, :address, :phone_number 
end

