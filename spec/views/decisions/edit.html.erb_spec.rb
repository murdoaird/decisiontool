require 'spec_helper'

describe "decisions/edit" do
  before(:each) do
    @decision = assign(:decision, stub_model(Decision,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit decision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", decision_path(@decision), "post" do
      assert_select "input#decision_title[name=?]", "decision[title]"
      assert_select "textarea#decision_description[name=?]", "decision[description]"
    end
  end
end
