Baconbnb.Views.StreetViewTab = Backbone.View.extend({
	template: JST["street/show"],
	
	initialize: function (options) {
		this.pad = options.pad;
	},
	
	renderStreetView: function () {
		var fenway = new google.maps.LatLng(this.pad.get("latitude"), this.pad.get("longitude"));
		var mapOptions = {
			center: fenway,
			zoom: 14,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var panoramaOptions = {
			position: fenway,
			pov: {
				heading: 34,
				pitch: 10
			}
		};
	  var panorama = new  google.maps.StreetViewPanorama(document.getElementById('pano'),panoramaOptions);
	},
	
	render: function (targetEl) {
		var renderedContent = this.template({
			pad: this.pad
		})
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
		this.renderStreetView();
	}
});