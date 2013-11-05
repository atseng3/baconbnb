class PadsController < ApplicationController
  def index
    @pads = Pad.all
    render :index
  end
  
  def show
    @pad = Pad.find(params[:id])
    render :show
  end
end
