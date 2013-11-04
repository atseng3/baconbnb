class Detail < ActiveRecord::Base
  attr_accessible :name, :pad_id, :value
  
  validates :name, :pad_id, :value, :presence => true
  
  belongs_to :pad, 
             :primary_key => :id, 
             :foreign_key => :pad_id, 
             :class_name => 'Pad'
             
  has_many :pad_details,
           :primary_key => :id, 
           :foreign_key => :detail_id,
           :class_name => 'PadDetail'
  
  has_many :similar_pads, :through => :pad_details, :source => :pad
end
