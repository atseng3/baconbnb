Baconbnb.Views.AmenitiesTab = Backbone.View.extend({
	template: JST["amenities/index"],
	
	initialize: function (options) {
		this.pad = options.pad;
		this.amenities = options.amenities;
		this.all_amens = ["Smoking Allowed", "Pets Allowed", "TV", "Cable TV", "Internet", "Wireless Internet", "Air Conditioning",
											"Heating", "Elevator in Building", "Handicap Accessible", "Pool", "Kitchen", "Free parking on premise",
											"Doorman", "Gym", "Hot Tub", "Indoor Fireplace", "Buzzer/Wireless Intercom", "Breakfast", 
											"Family/Kid Friendly", "Suitable for Events", "Washer", "Dryer"];
	},
	
	render: function (targetEl) {
		var renderedContent = this.template({
			amenities: this.amenities.pluck("name"),
			all_amens: this.all_amens
		})
		this.$el.html(renderedContent);
		this.$el.appendTo(targetEl);
	}
});