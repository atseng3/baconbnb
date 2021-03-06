class PadsController < ApplicationController
  before_filter :require_current_user!, :only => [:create, :new]
  
  def index
    @pads = Pad.all
    render 'static_pages/root'
  end
  
  def show
    @pad = Pad.find(params[:id])
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
      flash[:success] = ["Successully Listed a Pad!"]
      redirect_to user_url(current_user)
    else
      flash[:danger] = @pad.errors.full_messages
      redirect_to user_url(current_user)
    end
  end
end
