class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @chat_room = Chat.find(params[:id])
    @company_name = @chat_room.supplier.company_name
    @messages = @chat_room.messages
    @message = Message.new
  end
end
