class Neighborhood < ActiveRecord::Base
  attr_accessible :name, :description, :tag_line
  
  validates :name, :description, :tag_line, :presence => true
  
  has_many :pads,
           :primary_key => :id,
           :foreign_key => :neighborhood_id,
           :class_name => 'Pad'
end
