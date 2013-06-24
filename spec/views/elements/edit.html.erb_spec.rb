require 'spec_helper'

describe "elements/edit" do
  before(:each) do
    @element = assign(:element, stub_model(Element,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", element_path(@element), "post" do
      assert_select "input#element_name[name=?]", "element[name]"
      assert_select "textarea#element_description[name=?]", "element[description]"
    end
  end
end
