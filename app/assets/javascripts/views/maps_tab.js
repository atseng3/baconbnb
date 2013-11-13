Baconbnb.Views.MapsTab = Backbone.View.extend({
	template: JST["maps/show"],
	
	initialize: function (options) {
		this.pad = options.pad;
	},
	
	renderMap: function () {
		var that = this;
		handler = Gmaps.build('Google');
		handler.buildMap({ provider: { maxZoom: 17 }, internal: {id: 'map'}}, function(){
			// alert(that.pad.get("gmaps_hash").name);
		  markers = handler.addMarkers( [that.pad.get("gmaps_hash")] );
		  handler.bounds.extendWith(markers);
		  handler.fitMapToBounds();
		}); 
	},
	
  renderMap2: function () {
    var mapOptions = {
      center: new google.maps.LatLng(this.pad.get("latitude"), this.pad.get("longitude")),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
		var infoWindow = new google.maps.InfoWindow();
		var marker;
		// var i = 0;
		// Baconbnb.pads.each(function (pad) {
			// i += 1;
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(this.pad.get("latitude"), this.pad.get("longitude")),
			map: map
		});
			// debugger
		var that = this;
		google.maps.event.addListener(marker, "click", (function(marker) {
			return function(){
				infoWindow.setContent(that.pad.get("name"));
				infoWindow.open(map, marker);
			}
		})(marker));
		// });
  },
	
	render: function (targetEl) {
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
		this.renderMap2();		
	}
});