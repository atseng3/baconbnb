class Booking < ActiveRecord::Base
  attr_accessible :booker_id, :pad_id, :start_date, :end_date
  
  before_validation(on: :create) do
    self.status = "pending"
  end
  
  validates :booker_id, :pad_id, :start_date, :end_date, :presence => true
  
  validates :status, :inclusion => {in: %w(pending approved denied),
            message: "%{value} is not a valid status"}
            
  validate :overlapping_approved_request, on: :create       
  
  belongs_to :booker, 
             :primary_key => :id, 
             :foreign_key => :booker_id, 
             :class_name => 'User'
  
  belongs_to :pad,
             :primary_key => :id,
             :foreign_key => :pad_id, 
             :class_name => 'Pad'
             
   def overlapping_requests?(requests)
     return false if requests.first.nil?
     request.sort_by! { |request| request.start_date }
     (requests.count-2).times do |t|
       if request[t].end_date > request[t+1].start_date
         return true
       end
     end
     false
   end
   
   def overlapping_approved_requests
     requests = self.cat.rental_requests.map do |request|
       request if request.status == "approved"
     end
     
     errors.add(:overlap, "That's an overlapping request!!") if overlapping_requests?(requests)
   end
   
   def approve!
     self.status = "approved"
     self.save!
     overlapping_pending_requests
   end
   
   def deny!
     self.status = "denied"
     self.save!
   end
   
   def overlapping_pending_requests
     requests = self.cat.rental_requests.map do |request|
       request if request.status == "pending"
     end
     requests.delete(nil)
     deny = requests.select { |request| overlaps?(request) }
     CatRentalRequest.transaction do 
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
