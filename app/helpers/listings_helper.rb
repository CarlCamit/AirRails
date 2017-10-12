module ListingsHelper
    def format_address(address, city, country)
        "#{address}, #{city}, #{ISO3166::Country.new(country.upcase)}"
    end

    def format_coordinates(latitude, longitude)
        "#{latitude},#{longitude}"
    end

    def format_cents(cents, country)
        Money.new(cents, ISO3166::Country.new(country.upcase).currency.iso_code).format
    end
end
