class PhotosController < ApplicationController
  
  def new
    @pad = Pad.find(params[:pad_id])
    @photo = Photo.new()
    render :new
  end
  
  def create
    @photo = Photo.new(params[:photo])
  end
  
  def show
    
  end
end
