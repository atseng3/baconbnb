class PadsController < ApplicationController
  before_filter :require_current_user!
  
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
  
  def new
    @pad = Pad.new(params[:pad])
    render :new
  end
  
  def create
    @pad = Pad.new(params[:pad])
    if @pad.save
      render 'static_pages/root'
    else
      render :json => @pad.errors.full_messages, :status => :unprocessable_entity
    end
  end
end
