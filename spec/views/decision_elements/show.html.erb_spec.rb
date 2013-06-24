require 'spec_helper'

describe "decision_elements/show" do
  before(:each) do
    @decision_element = assign(:decision_element, stub_model(DecisionElement,
      :decision_id => 1,
      :element_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
