Baconbnb.Views.SearchView = Backbone.View.extend({
	template: JST["pads/search"],
	
	render: function () {
		var renderedContent = this.template({
			pads: this.collection
		});
		this.$el.html(renderedContent);
		return this;
	}
});