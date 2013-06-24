require 'spec_helper'

describe "decision_elements/index" do
  before(:each) do
    assign(:decision_elements, [
      stub_model(DecisionElement,
        :decision_id => 1,
        :element_id => 2
      ),
      stub_model(DecisionElement,
        :decision_id => 1,
        :element_id => 2
      )
    ])
  end

  it "renders a list of decision_elements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
