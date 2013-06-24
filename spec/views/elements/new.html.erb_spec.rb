require 'spec_helper'

describe "elements/new" do
  before(:each) do
    assign(:element, stub_model(Element,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", elements_path, "post" do
      assert_select "input#element_name[name=?]", "element[name]"
      assert_select "textarea#element_description[name=?]", "element[description]"
    end
  end
end
