Baconbnb.Views.Landing = Backbone.View.extend({
	template: JST["landing"],
	
	events: {
		"submit form": "searchLocation",
		"submit .login-form": "logUserIn",
		"click .signup-user": "signUserUp",
		"click .date-search-box": "dateTimePicker",
		"mouseenter .cities-icon": "mouseEnterCity",
		"mouseleave .cities-icon": "mouseLeaveCity"
	},
	
	mouseLeaveCity: function(event) {
		event.preventDefault();
		$(event.target).siblings().css("opacity", 0.1);
	},
	
	mouseEnterCity: function(event) {
		event.preventDefault();
		$(event.target).siblings().css("opacity", 1);
	},
	
	dateTimePicker: function (event) {
		$(".search-form_datetime").datetimepicker({format: 'yyyy-mm-dd'});
	},
	
	searchLocation: function (event) {
		event.preventDefault();
		
		Backbone.history.navigate("#index", { trigger: true });
	},
	
	render: function () {
		var renderedContent = this.template({
			title: "Welcome to Baconbnb"
		});
		this.$el.html(renderedContent);
		return this;
	}
});