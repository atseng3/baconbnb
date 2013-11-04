class PadDetail < ActiveRecord::Base
  attr_accessible :pad_id, :detail_id
  
  validates :pad_id, :detail_id, :presence => true
  
  belongs_to :pad,
             :primary_key => :id, 
             :foreign_key => :pad_id, 
             :class_name => 'Pad'
  
  belongs_to :detail,
             :primary_key => :id,  
             :foreign_key => :detail_id, 
             :class_name => 'Detail'
end
