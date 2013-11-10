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
		// $(".content").html(detailView.render().$el);
	},
	
	showAllPads: function () {
		var indexView = new Baconbnb.Views.PadsIndex({
			collection: Baconbnb.pads
		});
		this._swapView(indexView);
		// $(".content").html(indexView.render().$el);
		this.renderMap();
	},
	
	renderMap: function () {
		handler = Gmaps.build('Google');
		handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
		  markers = handler.addMarkers( Baconbnb.pads.pluck("gmaps_hash") );
		  handler.bounds.extendWith(markers);
		  handler.fitMapToBounds();
		}); 
	},
	
	// showSearchResults: function (location) {
	// 	// var params = parseQueryString(queryString);
	// 	console.log(location);
	// },
	
	showLandingPage: function () {
		var landingView = new Baconbnb.Views.Landing();
		this._swapView(landingView);
		// $(".content").html(landingView.render().$el);
	},
	
  _swapView: function (newView) {
    if (this._prevView) {
      this._prevView.remove();
    }

    this._prevView = newView;
    $(".content").html(newView.render().$el);
  }
});