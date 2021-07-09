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
    @favorite = current_supplier.favorites
    @user = @favorite.user
  end

  def create
  end
end
