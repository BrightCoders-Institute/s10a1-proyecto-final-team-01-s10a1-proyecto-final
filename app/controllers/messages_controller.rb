class MessagesController < ApplicationController
  def create
    @current_user = current_user
    @message = @current_user.messages.create(content: msg_params[:content], chat_room_id: params[:chat_room_id], user_id: @current_user.id)
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
