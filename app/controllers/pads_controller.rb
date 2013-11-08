class PadsController < ApplicationController
  before_filter :require_current_user!, :only => [:create]
  
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
    @pads = Pad.all
    
    if @pad.save
      render 'static_pages/root'
      # redirect_to root_url
    else
      flash[:errors] = @pad.errors.full_messages
      # render :json => @pad.errors.full_messages, :status => :unprocessable_entity
      redirect_to root_url
    end
  end
end
