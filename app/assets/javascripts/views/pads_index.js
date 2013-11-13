Baconbnb.Views.PadsIndex = Backbone.View.extend({
	template: JST["pads/index"],
	
	events: {
		"click .index-form_datetime": "invokeDatePicker",
		"click .heart": "heartPad",
		"click .filter-primary-item.span2.home": "searchHome",
		"click .filter-primary-item.span2.private": "searchPrivate",
		"click .filter-primary-item.span2.shared": "searchShared"
	},
	
	searchPrice: function(price) {
		var searchedPads = [];
		for (var i = 0; i < Baconbnb.pads.length; i++) {
			if (price > Baconbnb.pads.models[i].get("price")){
				searchedPads.push(Baconbnb.pads.models[i]);
			}
		}
		var searchView = new Baconbnb.Views.SearchView({
			collection: searchedPads
		});
		this._swapView(searchView);
	},
	
	searchShared: function(event) {
		var searchedPads = Baconbnb.pads.where({room_type: "Shared room"});
		var searchView = new Baconbnb.Views.SearchView({
			collection: searchedPads
		});

		this._swapView(searchView);
	},
	
	searchHome: function(event) {
		var searchedPads = Baconbnb.pads.where({room_type: "Home"});
		var searchView = new Baconbnb.Views.SearchView({
			collection: searchedPads
		});

		this._swapView(searchView);
	},
	
	searchPrivate: function(event) {
		var searchedPads = Baconbnb.pads.where({room_type: "Private room"});
		var searchView = new Baconbnb.Views.SearchView({
			collection: searchedPads
		});

		this._swapView(searchView);
	},
	
  _swapView: function (newView) {
    if (this._prevView) {
      this._prevView.remove();
    }

    this._prevView = newView;
    $(".pads-list").html(newView.render().$el);
  },
	
	heartPad: function (event) {
		// debugger
		$(event.target).toggleClass("glyphicon-heart")
	},
	
	invokeDatePicker: function (event) {
    $(".index-form_datetime").datetimepicker({format: 'yyyy-mm-dd'});
	},
	
  invokeSlider: function(event) {
		var that = this;
    $(this.$el.find("#slider-range-min")).slider({
      range: "min",
      value: 37,
      min: 1,
      max: 700,
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.value );
      },
			stop: function( event, ui ) {
				that.searchPrice(ui.value);
			}
    });
    $( "#amount" ).val( "$" + $( "#slider-range-min" ).slider( "value" ) );
  },
	
	render: function () {
		var renderedContent = this.template({
			pads: this.collection
		});
		this.$el.html(renderedContent);
		this.invokeSlider();
		return this;
	}
});