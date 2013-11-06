Baconbnb.Views.AmenitiesTab = Backbone.View.extend({
	template: JST["amenities/index"],
	
	initialize: function (options) {
		this.pad = options.pad;
		this.amenities = options.amenities;
	},
	
	render: function (targetEl) {
		var renderedContent = this.template({
			amenities: this.amenities
		})
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
	}
});