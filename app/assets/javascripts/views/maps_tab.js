Baconbnb.Views.MapsTab = Backbone.View.extend({
	template: JST["maps/show"],
	
	initialize: function (options) {
		this.pad = options.pad;
	},
	
	renderMap: function () {
		var that = this;
		handler = Gmaps.build('Google');
		handler.buildMap({ provider: { maxZoom: 17 }, internal: {id: 'map'}}, function(){
		  markers = handler.addMarkers( [that.pad.get("gmaps_hash")] );
		  handler.bounds.extendWith(markers);
		  handler.fitMapToBounds();
		}); 
	},
	
	render: function (targetEl) {
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
		this.renderMap();		
	}
});