Baconbnb.Collections.Bookings = Backbone.Collection.extend({
	initialize: function (models, options) {
		this.pad = options.pad;
	},
	
	model: Baconbnb.Models.Booking,
	
	url: function () {
		"/pads/" + this.pad.id + "/bookings"
	}
});