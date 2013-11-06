Baconbnb.Views.PadDetail = Backbone.View.extend({
	template: JST["pads/detail"],
	
	events: {
		"click .tab": "openTab"
	},
	
	// el: $("#tabContainer"),
	
	tabViews: {},
	
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
	
	render: function () {
		var renderedContent = this.template({
			pad: this.model,
			amenities: this.model.amenities
		});
		this.$el.html(renderedContent);
		return this;
	}
});