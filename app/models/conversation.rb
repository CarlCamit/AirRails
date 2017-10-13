class Conversation < ActiveRecord::Base
    belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
    belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
    belongs_to :listing
    
    has_many :messages, dependent: :destroy
    
    # validates_uniqueness_of :listing_id
    validates_uniqueness_of :sender_id, :scope => [:recipient_id, :listing_id]
    
    # scope :between, -> (sender_id, recipient_id) do
    #     where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
    # end

    scope :between, -> (sender_id, recipient_id, listing_id) do
        where("(conversations.sender_id = ? AND conversations.recipient_id = ? AND conversations.listing_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ? AND conversations.listing_id = ?)", sender_id, recipient_id, listing_id, recipient_id, sender_id, listing_id)
    end
end