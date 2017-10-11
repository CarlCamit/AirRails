require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :title => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :country_code => "MyString",
      :bed_count => 1,
      :bedroom_count => 1,
      :bathroom_count => 1,
      :description => "MyText",
      :night_fee_cents => 1,
      :cleaning_fee_cents => 1
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[street_address]"

      assert_select "input[name=?]", "listing[city]"

      assert_select "input[name=?]", "listing[country_code]"

      assert_select "input[name=?]", "listing[bed_count]"

      assert_select "input[name=?]", "listing[bedroom_count]"

      assert_select "input[name=?]", "listing[bathroom_count]"

      assert_select "textarea[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[night_fee_cents]"

      assert_select "input[name=?]", "listing[cleaning_fee_cents]"
    end
  end
end
