require 'spec_helper'

describe "calculations/show" do
  before(:each) do
    @calculation = assign(:calculation, stub_model(Calculation,
      :decision_id => 1,
      :element_id => 2,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Value/)
  end
end
