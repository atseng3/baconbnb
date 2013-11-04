class PadsController < ApplicationController
  def index
    @pads = Pad.all
    render :index
  end
end
