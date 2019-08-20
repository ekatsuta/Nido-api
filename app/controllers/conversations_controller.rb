class ConversationsController < ApplicationController
  def index
   conversations = Conversation.all
   render json: conversations
  end

  def create
   if Conversation.between(params[:sender_id],params[:recipient_id])
     .present?
      conversation = Conversation.between(params[:sender_id],
       params[:recipient_id])
   else
    conversation = Conversation.create(conversation_params)
   end

   render json: conversation
  end

  def readMessage
    conversation = Conversation.find(params[:id])
    receiving_messages = conversation.messages.select do |message|
        message.user_id != params[:currentUserId]
      end

    receiving_messages.each do |message|
      message.update(read: true)
    end
    

    render json: conversation
  end

  private
   def conversation_params
    params.permit(:sender_id, :recipient_id)
   end

end
