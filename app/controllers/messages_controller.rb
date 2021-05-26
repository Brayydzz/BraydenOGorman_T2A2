class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation

    def create
        if message_params[:body].empty?
            flash[:alert] = "You cannot send an empty message"
            redirect_to conversation_path(@conversation)
        else
            receipt = current_user.reply_to_conversation(@conversation, message_params[:body])
            redirect_to conversation_path(receipt.conversation)
            p message_params
        end
    end


    private

    def message_params
        params.permit(:body)
    end

    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end
end
