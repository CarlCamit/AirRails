class AddLatitudeAndLongitudeToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :latitude, :decimal, precision: 15, scale: 10, default: 0.0
    add_column :listings, :longitude, :decimal , precision: 15, scale: 10, default: 0.0
  end
end
