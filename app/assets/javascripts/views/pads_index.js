Baconbnb.Views.PadsIndex = Backbone.View.extend({
	template: JST["pads/index"],
	
	render: function () {
		var renderedContent = this.template({
			pads: this.collection
		});
		this.$el.html(renderedContent);
		return this;
	}
});