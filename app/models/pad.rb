class Pad < ActiveRecord::Base
  attr_accessible :name, :address, :owner_id, :description, 
                  :room_type, :bed_type, :accomodates, :bathrooms,
                  :min_stay, :country, :city, :neighborhood, :cancellation,
                  :neighborhood_id
  
  geocoded_by :address
  
  after_validation :geocode
  
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
          
  has_many :pad_amenities, 
           :primary_key => :id,
           :foreign_key => :pad_id, 
           :class_name => 'PadAmenity'
           
  has_many :amenities, :through => :pad_amenities, :source => :amenity
  
  belongs_to :neighborhood,
             :primary_key => :id, 
             :foreign_key => :neighborhood_id, 
             :class_name => 'Neighborhood'
  
  def as_json(options)
    super(:include => [:amenities])
  end
end
