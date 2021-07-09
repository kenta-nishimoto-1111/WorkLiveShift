class MessagesController < ApplicationController
  def create

    if current_user
      @sent_person = current_user.family_name
    elsif current_supplier
      @sent_person = current_supplier.company_name
    end

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
      params.require(:message).permit(:content).merge(sent_person: @sent_person)
    end
end
