require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        :user => nil,
        :bed => "Bed",
        :bath => "Bath",
        :zip => "Zip",
        :neighborhood => "Neighborhood",
        :price => "Price",
        :sqft => "Sqft"
      ),
      Property.create!(
        :user => nil,
        :bed => "Bed",
        :bath => "Bath",
        :zip => "Zip",
        :neighborhood => "Neighborhood",
        :price => "Price",
        :sqft => "Sqft"
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Bed".to_s, :count => 2
    assert_select "tr>td", :text => "Bath".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Neighborhood".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Sqft".to_s, :count => 2
  end
end
