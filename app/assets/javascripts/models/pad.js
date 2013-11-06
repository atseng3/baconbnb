Baconbnb.Models.Pad = Backbone.Model.extend({
	urlRoot: "/pads",
	
	amenities: function () {
		if (!this._amenities) {
			this._amenities = new Baconbnb.Collections.Amenities([], { pad: this });
		}
		return this._amenities;
	},
	
	parse: function (serverAttributes, options) {
		this.amenities().reset(serverAttributes.amenities);		
		delete serverAttributes.amenities;
		return serverAttributes;
	}
});