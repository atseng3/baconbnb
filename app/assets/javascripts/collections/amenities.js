Baconbnb.Collections.Amenities = Backbone.Collection.extend({
	initialize: function (models, options) {
		this.pad = options.pad;
	},
	
	model: Baconbnb.Models.Amenity,
	
	url: function () {
		"/pads/" + this.pad.id + "/amenities"
	}
});