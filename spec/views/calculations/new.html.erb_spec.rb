require 'spec_helper'

describe "calculations/new" do
  before(:each) do
    assign(:calculation, stub_model(Calculation,
      :decision_id => 1,
      :element_id => 1,
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new calculation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", calculations_path, "post" do
      assert_select "input#calculation_decision_id[name=?]", "calculation[decision_id]"
      assert_select "input#calculation_element_id[name=?]", "calculation[element_id]"
      assert_select "input#calculation_value[name=?]", "calculation[value]"
    end
  end
end
