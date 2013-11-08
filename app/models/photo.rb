class Photo < ActiveRecord::Base
  attr_accessible :pad_id, :image
  
  validates :pad_id, :image, :presence => true
  
  belongs_to :pad
end
