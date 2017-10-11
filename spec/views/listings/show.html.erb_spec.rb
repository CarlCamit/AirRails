require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
