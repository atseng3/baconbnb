Baconbnb.Views.PadDetail = Backbone.View.extend({
	template: JST["pads/detail"],
	
	initialize: function () {
		this.tabViews = {};
	},
	
	events: {
		"click .tab": "openTab",
		"click .form_datetime": "dateTimePicker",
		"submit form": "submitBooking"
	},
	
	dateTimePicker: function (event) {
		$(".form_datetime").datetimepicker({format: 'yyyy-mm-dd'});
	},
	
	submitBooking: function (event) {
		event.preventDefault();
		var payload = $(event.currentTarget).serializeJSON();
		var booking = new Baconbnb.Models.Booking(payload.booking, { parse: true, pad: this.model });
		
		if (!booking.isValid()) {
			booking.validationError.forEach(function (errorMessage) {
				this.$(".booking-form").append(
					"<br><div class='alert alert-danger fade in'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>x</button>" + errorMessage + "</div>"
				);
			});
			return;
		}
		var that = this;
		
		booking.save({}, {
			success: function () {
				that.model.bookings().add(booking);
				that.$(".booking-form").append(
					"<div class='alert alert-success fade in'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>x</button><h5>Congrats! You've just successfully submitted a booking!</h5><h6>You will see the booking calendar get updated once the owner makes a response!</h6></div>"
				);
			},
			error: function (model, resp) {
				debugger
				that.$(".booking-form").append(
					"<div class='alert alert-danger fade in'><button type=button' class='close' data-dismiss='alert' aria-hidden='true'>x</button>Please Log In to Continue!</div>"
				);
			}
		});
	},
	
	openTab: function (event) {
		var el = $(event.currentTarget);
		el.parent().children().removeClass("active");
		if (el.parent().attr("id") == "detailTabs") {
			var parentDiv = $("#detailContent");
		} else {
			var parentDiv = $("#visualContent");
		}
		parentDiv.children().detach();
		
		el.toggleClass("active");

		if(!this.tabViews[el.attr('id')]) {
			this.tabViews[el.attr('id')] = this.createTabViewForEl(el);
		}
		
		this.tabViews[el.attr("id")].render(parentDiv);
		// imageSlider.reload();
	},
	
	createTabViewForEl: function (el) {
		var tab;
		switch(el.attr("id")) {
		case "description":
			tab = new Baconbnb.Views.DescriptionTab({
				pad: this.model
			});
			break;
		case "amenities":
			tab = new Baconbnb.Views.AmenitiesTab({
				pad: this.model,
				amenities: this.model.amenities()
			});
			break;
		case "photos":
			tab = new Baconbnb.Views.PhotosTab({
				pad: this.model
			});
			break;
		case "maps":
			tab = new Baconbnb.Views.MapsTab({
				pad: this.model				
			});
			break;
		case "street-view":
			tab = new Baconbnb.Views.StreetViewTab({
				pad: this.model				
			});
			break;
		case "calendar":
			tab = new Baconbnb.Views.CalendarTab({
				pad: this.model				
			});
			break;
		}
		return tab;
	},
	
	renderFirstTab: function (tab){
		var el = (tab == "#photos" ? $("#photos") : $("#description"));
		el.parent().children().removeClass("active");
		if (el.parent().attr("id") == "detailTabs") {
			var parentDiv = $("#detailContent");
		} else {
			var parentDiv = $("#visualContent");
		}
		parentDiv.children().detach();
		
		el.toggleClass("active");

		if(!this.tabViews[el.attr('id')]) {
			this.tabViews[el.attr('id')] = this.createTabViewForEl(el);
		}

		this.tabViews[el.attr("id")].render(parentDiv);		
		// imageSlider.reload();
	},
	
	render: function () {
		var renderedContent = this.template({
			pad: this.model,
			amenities: this.model.amenities
		});
		this.$el.html(renderedContent);
		return this;
	}
});