class Decision < ActiveRecord::Base
  has_many :elements, :order => "id ASC"
  has_many :surveys
  attr_accessible :description, :title
end
