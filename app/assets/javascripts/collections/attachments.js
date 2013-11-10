Baconbnb.Collections.Attachments = Backbone.Collection.extend({
	initialize: function (models, options) {
		this.pad = options.pad;
	},
	
	model: Baconbnb.Models.Attachment,
	
	url: function () {
		return "/pads/" + this.pad.id + "/attachments";
	}
});