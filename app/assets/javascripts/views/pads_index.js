Baconbnb.Views.PadsIndex = Backbone.View.extend({
	template: JST["pads/index"],
	
	events: {
		"click .index-form_datetime": "invokeDatePicker"
	},
	
	invokeDatePicker: function (event) {
    $(".index-form_datetime").datetimepicker({format: 'yyyy-mm-dd'});
	},
	
  invokeSlider: function(event) {
    $(this.$el.find("#slider-range-min")).slider({
      range: "min",
      value: 37,
      min: 1,
      max: 700,
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.value );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range-min" ).slider( "value" ) );
  },
	
	render: function () {
		var renderedContent = this.template({
			pads: this.collection
		});
		this.$el.html(renderedContent);
		this.invokeSlider();
		return this;
	}
});