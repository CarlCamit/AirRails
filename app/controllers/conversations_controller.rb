class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing
    
    def index
        @users = User.all
        @conversations = Conversation.all
    end

    def create
        if params[:sender_id] != params[:recipient_id] # Sender and recipient should not be the same, will refactor to hide message button if current user == host
            if Conversation.between(params[:sender_id], params[:recipient_id], params[:listing_id]).present?
                @conversation = Conversation.between(params[:sender_id], params[:recipient_id], params[:listing_id]).first
            else
                @conversation = Conversation.create!(conversation_params)
            end
            redirect_to listing_conversation_messages_path(@listing, @conversation)
        else
            respond_to do |format|
                format.html { redirect_to listing_path(@listing), notice: 'You cannot send a message to yourself.' }
                format.json { head :no_content }
            end
        end
    end

    private

    def set_listing
        @listing = Listing.find(params[:listing_id])
    end

    def conversation_params
        params.permit(:sender_id, :recipient_id, :listing_id)
    end
end