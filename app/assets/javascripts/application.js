// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.serializeJSON
//= require underscore
//= require gmaps/google
//= require bootstrap
//= require gmaps/google
//= require backbone
//= require baconbnb
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .


handler = Gmaps.build('Google');
handler.buildMap({ provide: {}, internal: {id: 'map'}}, function () {
	markers = handler.addMarkers([
		{
			"lat": 0,
			"lng": 0, 
			"picture": {
				"url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
				"width": 36,
				"height": 36
			},
			"infowindow": "hello!"
		}
	]);
	handler.bounds.extendWith(markers);
	handler.fitMapToBounds();
});