class Conversation < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: "User"
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: "User"

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  # scope :between, -> (sender_id,recipient_id) do
  # where(“(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)”, sender_id,recipient_id, recipient_id, sender_id)
  # end

  def sender
    User.find(self.sender_id)
  end

  def recipient
    User.find(self.recipient_id)
  end

  def self.between(sender_id, recipient_id)
    sender_conversations = Conversation.all.select do |conversation|
      conversation.sender_id === sender_id
    end

    recipient_conversations = Conversation.all.select do |conversation|
      conversation.recipient_id === sender_id
    end

    check1 = sender_conversations.select do |conversation|
      conversation.recipient_id === recipient_id
    end
    check2 = recipient_conversations.select do |conversation|
      conversation.sender_id === recipient_id
    end

    if check1.length > 0
      check1[0]
    elsif check2.length > 0
      check2[0]
    end

  end

end
