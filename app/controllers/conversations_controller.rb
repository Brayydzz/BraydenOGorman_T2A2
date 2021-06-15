class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:update, :show, :destroy, :edit]

    def index 
        
        @conversations = current_user.mailbox.conversations.page(params[:page]).per(5)
        session[:listing_id] = nil
    end

    def show 
    end

    def new 
        # Prevents messages/conversations being shown twice
        @recipients = User.all - [current_user]
    end 

    def create 
        recipient = User.find(params[:user_id])

        # Provides validation when a user tries to send a message with empty fields
        if get_body[:body].empty? || get_subject[:subject].empty?
            flash[:alert] = "You cannot send an empty message"
            redirect_to new_conversation_path
        else
            receipt = current_user.send_message(recipient, get_body[:body], get_subject[:subject])
            redirect_to conversation_path(receipt.conversation)
        end
    end

    def destroy 
        @conversation.destroy
        redirect_to conversations_path
    end


    private
    # Sanitizes input for the body of a message
    def get_body
        params.permit(:body)
    end

    # Sanitizes input for the subject of a message
    def get_subject 
        params.permit(:subject)
    end
    # Sets the current conversation for each action assigned by before_action helper for user to view
    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end

end
