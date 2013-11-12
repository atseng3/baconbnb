class Booking < ActiveRecord::Base
  attr_accessible :booker_id, :pad_id, :start_date, :end_date, :num_guests
  
  before_validation(on: :create) do
    self.status = "pending"
  end
  
  validates :booker_id, :pad_id, :start_date, :end_date, :num_guests, :presence => true
  
  validates :status, :inclusion => {in: %w(pending approved denied),
            message: "%{value} is not a valid status"}
            
  validate :overlapping_approved_bookings, on: :create
  
  belongs_to :booker, 
             :primary_key => :id, 
             :foreign_key => :booker_id, 
             :class_name => 'User'
  
  belongs_to :pad,
             :primary_key => :id,
             :foreign_key => :pad_id, 
             :class_name => 'Pad'
             
   def overlapping_bookings?(bookings)
     puts bookings
     return false if bookings.first.nil?
     bookings.sort_by! { |booking| booking.start_date }
     (bookings.count-2).times do |t|
       if bookings[t].end_date > bookings[t+1].start_date
         return true
       end
     end
     false
   end
   
   def overlapping_approved_bookings
     bookings = self.pad.bookings.map do |booking|
       booking if booking.status == "approved"
     end
     bookings.delete(nil)
     
     errors.add(:overlap, "That's an overlapping booking!!") if overlapping_bookings?(bookings)
   end
   
   def approve!
     self.status = "approved"
     self.save!
     overlapping_pending_bookings
   end
   
   def deny!
     self.status = "denied"
     self.save!
   end
   
   def overlapping_pending_bookings
     bookings = self.pad.bookings.map do |booking|
       booking if booking.status == "pending"
     end
     bookings.delete(nil)
     deny = bookings.select { |booking| overlaps?(booking) }
     Booking.transaction do 
       deny.each do |req|
         req.status = "denied"
         req.save!
       end
     end
   end
   
   def overlaps?(other)
     (self.start_date - other.end_date) * (other.start_date - self.end_date) >= 0
   end   
end
