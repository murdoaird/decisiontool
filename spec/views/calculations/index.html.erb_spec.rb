require 'spec_helper'

describe "calculations/index" do
  before(:each) do
    assign(:calculations, [
      stub_model(Calculation,
        :decision_id => 1,
        :element_id => 2,
        :value => "Value"
      ),
      stub_model(Calculation,
        :decision_id => 1,
        :element_id => 2,
        :value => "Value"
      )
    ])
  end

  it "renders a list of calculations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
