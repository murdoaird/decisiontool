class Decision < ActiveRecord::Base
  has_many :elements
  has_many :surveys
  attr_accessible :description, :title
end
