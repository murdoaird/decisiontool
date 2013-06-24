require 'spec_helper'

describe "decision_elements/edit" do
  before(:each) do
    @decision_element = assign(:decision_element, stub_model(DecisionElement,
      :decision_id => 1,
      :element_id => 1
    ))
  end

  it "renders the edit decision_element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", decision_element_path(@decision_element), "post" do
      assert_select "input#decision_element_decision_id[name=?]", "decision_element[decision_id]"
      assert_select "input#decision_element_element_id[name=?]", "decision_element[element_id]"
    end
  end
end
