require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :title => "Title",
        :street_address => "Street Address",
        :city => "City",
        :country_code => "Country Code",
        :bed_count => 2,
        :bedroom_count => 3,
        :bathroom_count => 4,
        :description => "MyText",
        :night_fee_cents => 5,
        :cleaning_fee_cents => 6
      ),
      Listing.create!(
        :title => "Title",
        :street_address => "Street Address",
        :city => "City",
        :country_code => "Country Code",
        :bed_count => 2,
        :bedroom_count => 3,
        :bathroom_count => 4,
        :description => "MyText",
        :night_fee_cents => 5,
        :cleaning_fee_cents => 6
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
