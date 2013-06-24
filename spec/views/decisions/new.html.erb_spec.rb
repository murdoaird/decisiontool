require 'spec_helper'

describe "decisions/new" do
  before(:each) do
    assign(:decision, stub_model(Decision,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new decision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", decisions_path, "post" do
      assert_select "input#decision_title[name=?]", "decision[title]"
      assert_select "textarea#decision_description[name=?]", "decision[description]"
    end
  end
end
