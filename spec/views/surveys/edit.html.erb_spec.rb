require 'spec_helper'

describe "surveys/edit" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :decision_id => 1,
      :a_element_id => 1,
      :b_element_id => 1,
      :a_value => "9.99",
      :b_value => "9.99"
    ))
  end

  it "renders the edit survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", survey_path(@survey), "post" do
      assert_select "input#survey_decision_id[name=?]", "survey[decision_id]"
      assert_select "input#survey_a_element_id[name=?]", "survey[a_element_id]"
      assert_select "input#survey_b_element_id[name=?]", "survey[b_element_id]"
      assert_select "input#survey_a_value[name=?]", "survey[a_value]"
      assert_select "input#survey_b_value[name=?]", "survey[b_value]"
    end
  end
end
