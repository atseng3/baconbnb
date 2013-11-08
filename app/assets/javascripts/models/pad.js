Baconbnb.Models.Pad = Backbone.Model.extend({
	urlRoot: "/pads",
	
	amenities: function () {
		if (!this._amenities) {
			this._amenities = new Baconbnb.Collections.Amenities([], { pad: this });
		}
		return this._amenities;
	},
	
	owner: function () {
		if (!this._owner) {
			this._owner = new Baconbnb.Models.Owner();
		}
		return this._owner;
	},
	
	parse: function (serverAttributes, options) {
		debugger
		this.amenities().reset(serverAttributes.amenities);		
		this.owner().set(serverAttributes.owner);
		delete serverAttributes.amenities;
		delete serverAttributes.owner;
		return serverAttributes;
	}
});