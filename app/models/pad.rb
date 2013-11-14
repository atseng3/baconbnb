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
  
  has_many :amenities, :inverse_of => :pad, dependent: :destroy
  
  belongs_to :neighborhood,
             :primary_key => :id, 
             :foreign_key => :neighborhood_id, 
             :class_name => 'Neighborhood'
             
  has_many :photos
  
  has_many :attachments, :inverse_of => :pad, dependent: :destroy
    
  def approved_bookings
    if self.bookings.loaded?
      self.bookings.select { |booking| booking.status == "approved" }
    else
      self.bookings.where(status: "approved")
    end
  end

  def as_json(options)
    super(:include => [:amenities, :attachments, :bookings, {:owner => {:methods => [:profile_photo_url]}}], :methods => [:approved_bookings])
  end
end
