class MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages
  end

  def create
    message = Message.new(message_params)
   if message.valid?
     message.save
     render json: message
   else
     error = message.errors.full_messages[0]
     render json: {errors: error}
   end
  end

  private
   def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
   end
end
