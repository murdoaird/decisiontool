class Survey < ActiveRecord::Base
  belongs_to :decision
  before_destroy :ensure_not_referenced_by_any_decision
  attr_accessible :a_element_id, :a_value, :b_element_id, :b_value, :decision_id
end
