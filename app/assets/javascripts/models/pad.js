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
	
	attachments: function () {
		if (!this._attachments) {
			this._attachments = new Baconbnb.Collections.Attachments([], { pad: this });
		}
		return this._attachments;
	},
	
	parse: function (serverAttributes, options) {
		this.amenities().reset(serverAttributes.amenities);		
		this.owner().set(serverAttributes.owner);
		this.attachments().reset(serverAttributes.attachments);
		delete serverAttributes.amenities;
		delete serverAttributes.owner;
		delete serverAttributes.attachments;
		return serverAttributes;
	}
});