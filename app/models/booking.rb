class Booking < ActiveRecord::Base
  attr_accessible :booker_id, :pad_id
  
  validates :booker_id, :pad_id, :presence => true
  
  belongs_to :booker, 
             :primary_key => :id, 
             :foreign_key => :booker_id, 
             :class_name => 'User'
  
  belongs_to :pad,
             :primary_key => :id,
             :foreign_key => :pad_id, 
             :class_name => 'Pad'
end
