Baconbnb.Views.PhotosTab = Backbone.View.extend({
	template: JST["photos/index"],
	
	initialize: function (options) {
		this.pad = options.pad;
	},
	
	render: function (targetEl) {
		var renderedContent = this.template({
			attachments: this.pad.attachments()
		})
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
	}
});