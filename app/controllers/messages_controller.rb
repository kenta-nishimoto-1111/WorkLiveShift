class MessagesController < ApplicationController
  def create
    @chat_room = Chat.find(params[:chat_id])
    @message = @chat_room.messages.new(message_params)
    if @message.save
      redirect_to chat_path(@chat_room)
    else
      redirect_to chat_path(@chat_room)
    end
  end

  private
  
    def message_params
      params.require(:message).permit(:content).merge(sent_person: current_user.id)
    end
end
