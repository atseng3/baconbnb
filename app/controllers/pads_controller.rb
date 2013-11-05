class PadsController < ApplicationController
  def index
    @pads = Pad.all
    @hash = Gmaps4rails.build_markers(@pads) do |pad, marker|
      marker.lat pad.latitude
      marker.lng pad.longitude
      marker.infowindow pad.name
      # marker.picture({
      #   "url" => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
      #   "width" => 32,
      #   "height" => 32
      # })
      marker.json({ name: pad.name })
    end
    render 'static_pages/root'
  end
  
  def show
    @pad = Pad.find(params[:id])
    render :json => @pad
  end
end
