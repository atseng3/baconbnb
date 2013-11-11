class PadsController < ApplicationController
  before_filter :require_current_user!, :only => [:create]
  
  def index
    @pads = Pad.all
    render 'static_pages/root'
    # render :index
  end
  
  def show
    @pad = Pad.find(params[:id])
    # render :json => @pad
    render :show
  end
  
  def new
    @pad = Pad.new(params[:pad])
    render :new
  end
  
  def create
    @pad = Pad.new(params[:pad])
    @pad_amenities = params[:amenities]
    @pad_amenities.each do |amen|
      @pad.amenities.new(name: amen)
    end
    @pad.attachments.new(params[:attachments].values)
    
    if @pad.save
      redirect_to root_url
    else
      flash[:errors] = @pad.errors.full_messages
      redirect_to root_url
    end
  end
end
