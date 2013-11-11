Baconbnb.Models.Booking = Backbone.Model.extend({
	// this is not correct
	urlRoot: "/bookings",
	
	initialize: function (model, options) {
		this.pad = options.pad;
	},
	
	overlaps: function (other) {
		var approved_start = new Date(other.start_date)
		var approved_end = new Date(other.end_date)
		var booking_start = new Date(this.get("check_in"))
		var booking_end = new Date(this.get("check_out"))
		return ((approved_start - booking_end) * (booking_start - approved_end)) >= 0
	},
	
	validate: function () {
    var errors = [];
		var that = this;
		this.pad.get("approved_bookings").forEach(function(booking) {
			debugger
			if (that.overlaps(booking)){
				errors.push("This pad is already booked in that date range!");
			}
		});
	  if (this.get("check_in").length === 0 || this.get("check_out") === 0) {
      errors.push("Please input valid dates");
	  }
    
    return errors.length == 0 ? undefined : errors;
  }
});