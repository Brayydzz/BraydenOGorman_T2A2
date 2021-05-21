class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:update, :show, :destroy, :edit]

    def index 
        @conversations = current_user.mailbox.conversations
        session[:listing_id] = nil
    end

    def show 
    end

    def new 
        @recipients = User.all - [current_user]
    end 

    def create 
        recipient = User.find(params[:user_id])
        receipt = current_user.send_message(recipient, params[:body], params[:subject])
        redirect_to conversation_path(receipt.conversation)
    end


    private

    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end

end
