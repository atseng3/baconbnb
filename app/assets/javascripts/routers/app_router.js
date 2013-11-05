Baconbnb.AppRouter = Backbone.Router.extend({
	routes: {
		"": "showLandingPage",
		"search?*location": "showSearchResults"
	},
	
	showSearchResults: function (location) {
		// var params = parseQueryString(queryString);
		console.log(location);
	},
	
	showLandingPage: function () {
		var landingView = new Baconbnb.Views.Landing();
		$(".content").html(landingView.render().$el);
	}
});