Baconbnb.Views.Landing = Backbone.View.extend({
	template: JST["landing"],
	
	events: {
		"submit form": "searchLocation"
	},
	
	searchLocation: function () {
		event.preventDefault();
		
		Backbone.history.navigate("index", { trigger: true });
	},
	
	render: function () {
		var renderedContent = this.template({
			title: "Welcome to Baconbnb"
		});
		this.$el.html(renderedContent);
		return this;
	}
});