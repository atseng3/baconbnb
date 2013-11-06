Baconbnb.Views.DescriptionTab = Backbone.View.extend({
	template: JST["desc/details"],
	
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