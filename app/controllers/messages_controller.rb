class MessagesController < ApplicationController
    before_action do
        @listing = Listing.find(params[:listing_id])
        @conversation = Conversation.find(params[:conversation_id])
    end

    # before_action :set_listing
    # before_action :set_conversation

    def index
        @conversation = Conversation.find(params[:conversation_id])
        p @conversation.inspect
        @messages = @conversation.messages
        
        if @messages.length > 10
            @over_ten = true
            @messages = @messages[-10..-1]
        end

        if params[:m]
            @over_ten = false
            @messages = @conversation.messages
        end

        if @messages.last
            if @messages.last.user_id != current_user.id
                @messages.last.read = true;
            end
        end

        @message = @conversation.messages.new
    end

    def new
        @message = @conversation.messages.new
    end

    def create
        @message = @conversation.messages.new(message_params)

        if @message.save
            redirect_to listing_conversation_messages_path(@listing, @conversation)
        end
    end

    private

    def set_conversation
        @conversation = Conversation.find(params[:conversation_id])
    end

    def set_listing
        @listing = Listing.find(params[:listing_id])
    end

    def message_params
        params.require(:message).permit(:body, :user_id)
    end
end