class ChatsController < ApplicationController
  def index
  end

  def show
    @chat_room = Chat.find(params[:id])
    @messages = @chat_room.messages
  end

  def new
  end

  def create
  end
end
