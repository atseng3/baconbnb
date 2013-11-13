Baconbnb.AppRouter = Backbone.Router.extend({
	routes: {
		"": "showLandingPage",
		"pads/:id": "showPad",
		"index": "showAllPads"
	},
	
	showPad: function (id) {
		var detailView = new Baconbnb.Views.PadDetail({
			model: Baconbnb.pads.get(id)
		});
		this._swapView(detailView);

		detailView.renderFirstTab("#photos");
		detailView.renderFirstTab("#description");
	},
	
	showAllPads: function () {
		var indexView = new Baconbnb.Views.PadsIndex({
			collection: Baconbnb.pads
		});
		this._swapView(indexView);
		this.renderMap2();
	},
	
	renderMap: function () {
		handler = Gmaps.build('Google');
		handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
		  markers = handler.addMarkers( Baconbnb.pads.pluck("gmaps_hash") );
		  handler.bounds.extendWith(markers);
		  handler.fitMapToBounds();
		}); 
	},
	
  renderMap2: function () {
    var mapOptions = {
      center: new google.maps.LatLng(37.7362715, -122.4277995),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
		var infoWindow = new google.maps.InfoWindow();
		var marker;
		var i = 0;
		Baconbnb.pads.each(function (pad) {
			i += 1;
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(pad.get("latitude"), pad.get("longitude")),
				map: map
			});
			// debugger
			google.maps.event.addListener(marker, "click", (function(marker, i) {
				return function(){
					infoWindow.setContent(Baconbnb.pads.models[i].get("name"));
					infoWindow.open(map, marker);
				}
			})(marker, i));
		});
  },
	
	showLandingPage: function () {
		var landingView = new Baconbnb.Views.Landing();
		this._swapView(landingView);
	},
	
  _swapView: function (newView) {
    if (this._prevView) {
      this._prevView.remove();
    }

    this._prevView = newView;
    $(".content").html(newView.render().$el);
  }
});