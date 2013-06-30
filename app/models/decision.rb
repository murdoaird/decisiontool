class Decision < ActiveRecord::Base
  has_many :elements, dependent: :destroy
  has_many :surveys
  attr_accessible :description, :title
end
