class MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages
  end

  def create
    conversation = Conversation.find(params[:conversation_id])
    message = Message.new(message_params)
   if message.save
    render json: message
   else
    render json: {errors: "ERROR"}
   end
  end

  private
   def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
   end
end
