class Survey < ActiveRecord::Base
  belongs_to :decision
  attr_accessible :a_element_id, :a_value, :b_element_id, :b_value, :decision_id, :a_value_row, :a_value_col, :b_value_row, :b_value_col 
end
