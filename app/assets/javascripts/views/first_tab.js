Baconbnb.Views.FirstContentTab = Backbone.View.extend({
	render: function (targetEl) {
		this.setElement($("#someContentEl"));
		this.$el.appenTo(targetEl);
	}
});
