require 'spec_helper'

describe "surveys/show" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :decision_id => 1,
      :a_element_id => 2,
      :b_element_id => 3,
      :a_value => "9.99",
      :b_value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
