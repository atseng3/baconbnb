Baconbnb.Views.CalendarTab = Backbone.View.extend({
	template: JST["calendar/show"],
	
	initialize: function (options) {
		this.pad = options.pad;
	},
	
	renderCal: function () {
		var approvedBookings = this.pad.get("approved_bookings");
		eventsHash = [];
		approvedBookings.forEach(function (booking){
			eventsHash.push({title: "Booked", start: new Date(booking.start_date), end: new Date(booking.end_date)});
		});
		$(".calendar-show").fullCalendar({
			editable: true,
			events: eventsHash
		});
	},
	
	render: function (targetEl) {
		var renderedContent = this.template({
			pad: this.pad
		})
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
		this.renderCal();
	}
});