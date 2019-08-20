class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :read, :conversation, :user, :user_id
  belongs_to :conversation
  belongs_to :user
end
