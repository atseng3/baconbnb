window.Baconbnb = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		var parsed_pads = JSON.parse($("#bootstrapped_pads_json").html());
		Baconbnb.pads = new Baconbnb.Collections.Pads(parsed_pads.pads, { parse: true });
    new Baconbnb.AppRouter();
		Backbone.history.start();
  }
};

$(document).ready(function(){
  Baconbnb.initialize();
	// $(".guide").hover(function (){
	// 	$(this).stop().animate({"opacity": "0.7"}, "slow");
	// }, function (){
	// 	$(this).stop().animate({"opacity": "1"}, "flow");
	// });
});

