require 'spec_helper'

describe "surveys/new" do
  before(:each) do
    assign(:survey, stub_model(Survey,
      :decision_id => 1,
      :a_element_id => 1,
      :b_element_id => 1,
      :a_value => "9.99",
      :b_value => "9.99"
    ).as_new_record)
  end

  it "renders new survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", surveys_path, "post" do
      assert_select "input#survey_decision_id[name=?]", "survey[decision_id]"
      assert_select "input#survey_a_element_id[name=?]", "survey[a_element_id]"
      assert_select "input#survey_b_element_id[name=?]", "survey[b_element_id]"
      assert_select "input#survey_a_value[name=?]", "survey[a_value]"
      assert_select "input#survey_b_value[name=?]", "survey[b_value]"
    end
  end
end
