Baconbnb.Views.PadDetail = Backbone.View.extend({
	template: JST["pads/detail"],
	
	event: {
		"click .tab": "openTab"
	},
	
	el: $("#tabContainer"),
	
	tabViews: {},
	
	openTab: function (e) {
		debugger
		var el = $(e.currentTarget);
		$("#contentContainer").children().detach();
		
		if(!this.tabViews[el.attr('id')]) {
			this.tabViews[el.attr('id')] = this.createTabViewForEl(el);
		}
		
		this.tabViews[el.attr("id")].render($("#contentContainer"));
	},
	
	createTabViewForEl: function (el) {
		var tab;
		switch(el.attr("id")) {
		case "content1Tab":
			tab = new FirstContentTab();
			break;
		}
		return tab;
	}
	
	render: function () {
		var renderedContent = this.template({
			pad: this.model,
			amenities: this.model.amenities
		});
		this.$el.html(renderedContent);
		return this;
	}
});