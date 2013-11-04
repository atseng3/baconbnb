class PadAmenity < ActiveRecord::Base
  attr_accessible :pad_id, :amenity_id
  
  validates :pad_id, :amenity_id, :presence => true
  
  belongs_to :pad, 
             :primary_key => :id,
             :foreign_key => :pad_id, 
             :class_name => 'Pad'
  
  belongs_to :amenity, 
             :primary_key => :id,
             :foreign_key => :amenity_id, 
             :class_name => 'Amenity'
end
