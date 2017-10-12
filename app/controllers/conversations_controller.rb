class ConversationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
        @conversations = Conversation.all
    end

    def create
        @listing = Listing.find(params[:listing_id])

        if Conversation.between(params[:sender_id],params[:recipient_id], params[:listing_id]).present?
            @conversation = Conversation.between(params[:sender_id], params[:recipient_id], params[:listing_id]).first
        else
            @conversation = Conversation.create!(conversation_params)
        end

        redirect_to listing_conversation_messages_path(@listing, @conversation)
    end

    private

    def conversation_params
        params.permit(:sender_id, :recipient_id, :listing_id)
    end
end