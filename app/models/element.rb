class Element < ActiveRecord::Base
  belongs_to :decision
  attr_accessible :description, :name, :decision_id
end
