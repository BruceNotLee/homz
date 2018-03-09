require 'rails_helper'

RSpec.describe "properties/new", type: :view do
  before(:each) do
    assign(:property, Property.new(
      :user => nil,
      :bed => "MyString",
      :bath => "MyString",
      :zip => "MyString",
      :neighborhood => "MyString",
      :price => "MyString",
      :sqft => "MyString"
    ))
  end

  it "renders new property form" do
    render

    assert_select "form[action=?][method=?]", properties_path, "post" do

      assert_select "input[name=?]", "property[user_id]"

      assert_select "input[name=?]", "property[bed]"

      assert_select "input[name=?]", "property[bath]"

      assert_select "input[name=?]", "property[zip]"

      assert_select "input[name=?]", "property[neighborhood]"

      assert_select "input[name=?]", "property[price]"

      assert_select "input[name=?]", "property[sqft]"
    end
  end
end
