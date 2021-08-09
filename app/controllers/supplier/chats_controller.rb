class Supplier::ChatsController < ApplicationController
  before_action :authenticate_supplier!

  def index; end

  def show
    @chat_room = Chat.find(params[:id])
    @user_name = @chat_room.user.family_name
    @messages = @chat_room.messages
    @message = Message.new
    @chat_room.supplier.supplier_notifications.where(user_id: @chat_room.user, notification_type: 'message',
                                                     checked_at: nil).update(checked_at: Time.current)
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
      @chat.supplier.supplier_notifications.where(user_id: @chat.user_id, notification_type: 'entry',
                                                  checked_at: nil).update(checked_at: Time.current)
      redirect_to supplier_chats_path
    else
      render 'new'
    end
  end

  def chat_params
    params.require(:chat).permit(:user_id).merge(supplier_id: current_supplier.id, latest_message_time: Time.current)
  end
end
