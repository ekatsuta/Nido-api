class User < ApplicationRecord
  has_many :listings
  has_many :cases
  has_many :messages
  # has_many :conversations, class_name: "Conversation", foreign_key: "sender_id"

  # has_many :placements, through: :listings
  # has_many :placements, through: :cases

  def placements
    if self.user_type === 'host'
      placements = listings.map do |listing|
        listing.placements
      end
      placements.flatten()
    else self.user_type === 'caseworker'
      placements = cases.map do |listing|
        listing.placements
      end
      placements.flatten()
    end
  end

  def conversations
    Conversation.all.select do |conversation|
      conversation.sender_id === self.id || conversation.recipient_id === self.id
    end
  end

  has_secure_password
  validates :username, uniqueness: true


end
