class Supplier::MessagesController < ApplicationController
  def create
    if current_user
      @sent_person = current_user.family_name
    elsif current_supplier
      @sent_person = current_supplier.company_name
    end
    @chat_room = Chat.find(params[:chat_id])
    @message = @chat_room.messages.new(message_params)
    if @message.save
      @chat_room.update(latest_message: @message.content, latest_message_time: Time.current)
      @chat_room.user.user_notifications.create(supplier: current_supplier)
    end
    redirect_to supplier_chat_path(@chat_room)
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(sent_person: @sent_person)
  end
end

