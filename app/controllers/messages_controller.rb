class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation

    def create
        # Provides validation when a user tries to send a message with empty fields
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
    # Sanitizes input for the body of a message
    def message_params
        params.permit(:body)
    end

    # Sets the current conversation for each action assigned by before_action helper for user to view
    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end
end
