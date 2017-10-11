class Listing < ApplicationRecord
    geocoded_by :full_address
    after_validation :geocode

    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute

    def country
        ISO3166::Country.new(country_code.upcase)
    end

    def full_address
        "#{street_address}, #{city}, #{country.name}"
    end

    def coordinates
        "#{latitude},#{longitude}"
    end

    def night_fee_dollars
        Money.new(night_fee_cents, "AUD").format
    end

    def cleaning_fee_dollars
        Money.new(cleaning_fee_cents, "AUD").format
    end
end
