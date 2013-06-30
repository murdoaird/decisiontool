require 'spec_helper'

describe "calculations/edit" do
  before(:each) do
    @calculation = assign(:calculation, stub_model(Calculation,
      :decision_id => 1,
      :element_id => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit calculation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", calculation_path(@calculation), "post" do
      assert_select "input#calculation_decision_id[name=?]", "calculation[decision_id]"
      assert_select "input#calculation_element_id[name=?]", "calculation[element_id]"
      assert_select "input#calculation_value[name=?]", "calculation[value]"
    end
  end
end
