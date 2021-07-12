class ChatsController < ApplicationController
  def index
  end

  def show
    @chat_room = Chat.find(params[:id])
    @messages = @chat_room.messages
    @message = Message.new
  end

  def new
    @chat = Chat.new
    @entry = current_supplier.entries
  end

  def create
    @chat = Chat.new(chat_params)
    @entry = current_supplier.entries
    if @chat.save
      redirect_to chats_path
    else
      render 'new'
    end
  end

  def chat_params
    params.require(:chat).permit(:user_id).merge(supplier_id: current_supplier.id, latest_message_time: Time.current)
  end

end
