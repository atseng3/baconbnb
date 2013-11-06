class PadsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @pads = Pad.all
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
