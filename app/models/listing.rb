class Listing < ApplicationRecord
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute

    geocoded_by :full_address
    after_validation :geocode

    has_many :conversations, dependent: :destroy
    belongs_to :host, :foreign_key => :host_id, class_name: 'User'

    def full_address
        "#{street_address}, #{city}, #{ISO3166::Country.new(country_code.upcase).name}"
    end

end
