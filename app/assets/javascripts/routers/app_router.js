Baconbnb.AppRouter = Backbone.Router.extend({
	routes: {
		"": "showLandingPage",
		"pads/:id": "showPad",
		// "search?*location": "showSearchResults",
		"index": "showAllPads"

	},
	
	showPad: function (id) {
		var detailView = new Baconbnb.Views.PadDetail({
			model: Baconbnb.pads.get(id)
		});
		this._swapView(detailView);
		// $(".content").html(padView.render().$el);
		
	},
	
	showAllPads: function () {
		var indexView = new Baconbnb.Views.PadsIndex({
			collection: Baconbnb.pads
		});
		this._swapView(indexView);
		// $(".content").html(indexView.render().$el);
	},
	
	showSearchResults: function (location) {
		// var params = parseQueryString(queryString);
		console.log(location);
	},
	
	showLandingPage: function () {
		var landingView = new Baconbnb.Views.Landing();
		this._swapView(landingView);
		// $(".content").html(landingView.render().$el);
	},
	
  _swapView: function (newView) {
    if (this._prevView) {
      // this._prevView.stopListening();
      this._prevView.remove();
    }

    this._prevView = newView;
    newView.render();
    $("body").html(newView.$el);
  }
});