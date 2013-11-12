Baconbnb.Views.Landing = Backbone.View.extend({
	template: JST["landing"],
	
	events: {
		"submit form": "searchLocation",
		"submit .login-form": "logUserIn",
		"click .signup-user": "signUserUp",
		"click .date-search-box": "dateTimePicker"
	},
	
	dateTimePicker: function (event) {
		$(".search-form_datetime").datetimepicker({format: 'yyyy-mm-dd'});
	},
	
	searchLocation: function () {
		event.preventDefault();
		
		Backbone.history.navigate("index", { trigger: true });
	},
	
	render: function () {
		var renderedContent = this.template({
			title: "Welcome to Baconbnb"
		});
		this.$el.html(renderedContent);
		return this;
	}
});