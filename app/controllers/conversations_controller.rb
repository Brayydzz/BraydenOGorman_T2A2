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
        @recipients = User.all - [current_user]
    end 

    def create 
        recipient = User.find(params[:user_id])
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

    def get_body
        params.permit(:body)
    end


    def get_subject 
        params.permit(:subject)
    end

    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end

end
