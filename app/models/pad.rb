class Pad < ActiveRecord::Base
  attr_accessible :name, :address, :owner_id, :description, 
                  :room_type, :bed_type, :accomodates, :bathrooms,
                  :min_stay, :country, :city, :neighborhood, :cancellation,
                  :neighborhood_id, :filepicker_url, :price
  
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
          
  # has_many :pad_amenities, 
  #          :primary_key => :id,
  #          :foreign_key => :pad_id, 
  #          :class_name => 'PadAmenity'
           
  # has_many :amenities, :through => :pad_amenities, :source => :amenity
  
  has_many :amenities, :inverse_of => :pad, dependent: :destroy
  
  belongs_to :neighborhood,
             :primary_key => :id, 
             :foreign_key => :neighborhood_id, 
             :class_name => 'Neighborhood'
             
  has_many :photos
  
  # has_many :pad_attachments
  
  # has_many :attachments, :through => :pad_attachments, :source => :attachment
  has_many :attachments, :inverse_of => :pad, dependent: :destroy
  
  def gmaps_hash
    hash = Gmaps4rails.build_markers([self]) do |pad, marker|
      marker.lat pad.latitude
      marker.lng pad.longitude
      marker.infowindow pad.name
      marker.json({ name: pad.name })
    end
    hash[0]
  end

  def as_json(options)
    super(:include => [:amenities, :attachments, {:owner => {:methods => [:profile_photo_url]}}], :methods => [:gmaps_hash])
  end
end
