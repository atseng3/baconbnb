class Attachment < ActiveRecord::Base
  attr_accessible :filename, :mimetype, :size, :url, :pad_id
  
  validates :filename, :mimetype, :size, :url, :pad, :presence => :true
  
  # has_many :pad_attachments
  belongs_to :pad
  
  # has_many :pads, :through => :pad_attachments, :source => :pad
end
