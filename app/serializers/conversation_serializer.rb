class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :recipient_id, :sender, :recipient, :messages
  has_many :messages, include_nested_associations: true

end
