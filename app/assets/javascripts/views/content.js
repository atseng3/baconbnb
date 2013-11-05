Baconbnb.Views.ContentView = Backbone.View.extend({
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
	
	createTabViewForel: function (el) {
		var tab;
		switch(el.attr("id")) {
		case "content1Tab":
			tab = new FirstContentTab();
			break;
		}
		return tab;
	}
});

