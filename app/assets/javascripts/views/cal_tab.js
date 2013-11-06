Baconbnb.Views.CalendarTab = Backbone.View.extend({
	template: JST["calendar/show"],
	
	initialize: function (options) {
		this.pad = options.pad;
	},
	
	render: function (targetEl) {
		var renderedContent = this.template({
			pad: this.pad
		})
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
	}
});