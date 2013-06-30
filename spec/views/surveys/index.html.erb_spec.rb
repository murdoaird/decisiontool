require 'spec_helper'

describe "surveys/index" do
  before(:each) do
    assign(:surveys, [
      stub_model(Survey,
        :decision_id => 1,
        :a_element_id => 2,
        :b_element_id => 3,
        :a_value => "9.99",
        :b_value => "9.99"
      ),
      stub_model(Survey,
        :decision_id => 1,
        :a_element_id => 2,
        :b_element_id => 3,
        :a_value => "9.99",
        :b_value => "9.99"
      )
    ])
  end

  it "renders a list of surveys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
