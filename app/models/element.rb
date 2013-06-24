class Element < ActiveRecord::Base
  belongs_to :decision
  before_destroy :ensure_not_referenced_by_any_decision
  attr_accessible :description, :name
end
