class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :description, :user_type, :username, :profile_image, :placements, :messages, :conversations
  has_many :cases, include_nested_associations: true
  has_many :listings, include_nested_associations: true
  has_many :messages, include_nested_associations: true
  has_many :conversations, include_nested_associations: true



end
