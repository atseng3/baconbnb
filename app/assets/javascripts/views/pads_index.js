Baconbnb.Views.PadsIndex = Backbone.View.extend({
	template: JST["pads/index"],
	
	events: {
		"click .form_datetime": "invokeDatePicker",
		"click #slider-range-main": "invokeSlider"
	},
	
	invokeDatePicker: function (event) {
    $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd'});
	},
	
  invokeSlider: function(event) {
    $("#slider-range-min").slider({
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
		return this;
	}
});