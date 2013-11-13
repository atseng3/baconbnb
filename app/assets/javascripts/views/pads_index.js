Baconbnb.Views.PadsIndex = Backbone.View.extend({
	template: JST["pads/index"],
	
	events: {
		"click #date-start": "invokeDatePicker",
		"click #date-end": "invokeDatePicker",
		"click .heart": "heartPad",
		"click .filter-primary-item.span2.home": "searchHome",
		"click .filter-primary-item.span2.private": "searchPrivate",
		"click .filter-primary-item.span2.shared": "searchShared",
		"change .form-horizontal.drop-down": "numGuestSearch"
	},
	
	searchHelper: function (searchedPads) {
		var searchedView = new Baconbnb.Views.SearchView({
			collection: searchedPads
		});
		this._swapView(searchedView);
	},
	
	numGuestSearch: function (event) {
		val = parseInt($(event.target).val());
		searchedPads = Baconbnb.pads.where({accomodates: val});
		this.searchHelper(searchedPads);
	},
	
	searchPrice: function(price) {
		var searchedPads = [];
		for (var i = 0; i < Baconbnb.pads.length; i++) {
			if (price > Baconbnb.pads.models[i].get("price")){
				searchedPads.push(Baconbnb.pads.models[i]);
			}
		}
		this.searchHelper(searchedPads);
	},
	
	searchShared: function(event) {
		var searchedPads = Baconbnb.pads.where({room_type: "Shared room"});
		this.searchHelper(searchedPads);
	},
	
	searchHome: function(event) {
		var searchedPads = Baconbnb.pads.where({room_type: "Home"});
		this.searchHelper(searchedPads);
	},
	
	searchPrivate: function(event) {
		var searchedPads = Baconbnb.pads.where({room_type: "Private room"});
		this.searchHelper(searchedPads);
	},
	
	searchDate: function () {
		var searchedPads = [];
		var that = this;
		Baconbnb.pads.each(function(pad) {
			var invalid = false;
			pad.get("approved_bookings").forEach(function(booking) {
				var start = Date.parse(booking.start_date);
				var end = Date.parse(booking.end_date);
				if (that.overlaps(start, end)) {
					invalid = true;
					// break;
				}
			});
			if (!invalid) {
				searchedPads.push(pad);
			}
		});
		this.searchHelper(searchedPads);
	},
	
	overlaps: function (start, end) {
		return ((this.startDate - end) * (start - this.endDate)) >= 0
	},
	
  _swapView: function (newView) {
    if (this._prevView) {
      this._prevView.remove();
    }

    this._prevView = newView;
    $(".pads-list").html(newView.render().$el);
  },
	
	heartPad: function (event) {
		$(event.target).toggleClass("glyphicon-heart")
	},
	
	invokeDatePicker: function (event) {
		var that = this;
		var d = event.target;
		if (d.id == "date-start" && !this.startDate){
			$(d).datetimepicker('show').on('changeDate', function(ev){
				$(d).datetimepicker('hide');
				that.startDate = ev.date.valueOf();
			});
		} else {
			$(d).datetimepicker('show').on('changeDate', function(ev){
				$(d).datetimepicker('hide');
				if (that.startDate) {
					if (ev.date.valueOf() - that.startDate > 0) {
						that.endDate = ev.date.valueOf();
						that.searchDate();
					} else {						
						$(".trip-form-error-area").html(
							"<br><div class='alert alert-danger fade in'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>x</button>Please Input a valid Date!</div>"
						);
					}
				}
			});
		}
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