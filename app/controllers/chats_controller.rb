class ChatsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
    @chat_room = Chat.find(params[:id])
    @messages = @chat_room.messages
    @message = Message.new
  end

  def new
    @chat = Chat.new
    has_chat_user_ids = current_supplier.chats.pluck(:user_id)
    @entries = current_supplier.entries.where.not(user_id: has_chat_user_ids)
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
