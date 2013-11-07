Baconbnb.Views.CalendarTab = Backbone.View.extend({
	template: JST["calendar/show"],
	
	initialize: function (options) {
		this.pad = options.pad;
	},
	
	renderCal: function () {
		var todaydate = new Date()
		var curmonth = todaydate.getMonth()+1 //get current month (1-12)
		var curyear = todaydate.getFullYear() //get current year

		return buildCal(curmonth ,curyear, "main", "month", "daysofweek", "days", 1);
	},
	
	render: function (targetEl) {
		var renderedContent = this.template({
			pad: this.pad
		})
		this.$el.html(this.renderCal());
		this.$el.appendTo(targetEl);
	}
});