class Amenity < ActiveRecord::Base
  attr_accessible :name, :pad_id
  
  validates :name, :pad, :presence => true
  
  # has_many :pad_amenities, 
#            :primary_key => :id, 
#            :foreign_key => :amenity_id, 
#            :class_name => 'PadAmenity'
  
  # has_many :pads, :through => :pad_amenities, :source => :pad
  belongs_to :pad
end
