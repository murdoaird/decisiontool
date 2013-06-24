require 'spec_helper'

describe "decision_elements/new" do
  before(:each) do
    assign(:decision_element, stub_model(DecisionElement,
      :decision_id => 1,
      :element_id => 1
    ).as_new_record)
  end

  it "renders new decision_element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", decision_elements_path, "post" do
      assert_select "input#decision_element_decision_id[name=?]", "decision_element[decision_id]"
      assert_select "input#decision_element_element_id[name=?]", "decision_element[element_id]"
    end
  end
end
