require 'rails_helper'

RSpec.describe "properties/show", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :user => nil,
      :bed => "Bed",
      :bath => "Bath",
      :zip => "Zip",
      :neighborhood => "Neighborhood",
      :price => "Price",
      :sqft => "Sqft"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Bed/)
    expect(rendered).to match(/Bath/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Neighborhood/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Sqft/)
  end
end
