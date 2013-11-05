window.Baconbnb = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		Baconbnb.pads = JSON.parse($("#bootstrapped_pads_json").html());
    new Baconbnb.AppRouter();
		Backbone.history.start();
  }
};

$(document).ready(function(){
  Baconbnb.initialize();
});
