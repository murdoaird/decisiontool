class Decision < ActiveRecord::Base
  has_many :elements, dependent: :destroy
  attr_accessible :description, :title
end
