class MessagesController < ApplicationController
  before_action :authenticate_member!

  def index
    @send_messages = current_member.send_messages
    @receive_messages = current_member.receive_messages
    #@message = current_member.messages.find_by_id(receiver_id: @message.receiver_id)
  end
  
	def new
		@message = Message.new
  end

  def create
    message = current_member.send_messages.create(message_params)
    message ? (redirect_to messages_path) : (redirect_to :back)
  end

  def show
    @message = current_member.messages(parmas[:id])
  end

  protected
  def message_params
  	params.require(:message).permit(:body ,:receiver_id, :sender_id, :member_id)
  end
end

