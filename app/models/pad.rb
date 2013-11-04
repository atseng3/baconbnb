class Pad < ActiveRecord::Base
  attr_accessible :name, :address, :owner_id, :description
  
  validates :name, :address, :owner_id, :description, :presence => true
  
  belongs_to :owner, 
             :primary_key => :id, 
             :foreign_key => :owner_id, 
             :class_name => 'User'
             
  has_many :bookings,
           :primary_key => :id,
           :foreign_key => :pad_id,
           :class_name => 'Booking'
           
  has_many :booked_users, :through => :bookings, :source => :booker
  
  has_many :pad_details, 
           :primary_key => :id, 
           :foreign_key => :pad_id, 
           :class_name => 'PadDetail'

  has_many :details, :through => :pad_details, :source => :detail
          
  has_many :pad_amenities, 
           :primary_key => :id,
           :foreign_key => :pad_id, 
           :class_name => 'PadAmenity'
           
  has_many :amenities, :through => :pad_amenities, :source => :amenity
end
