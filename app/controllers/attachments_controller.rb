class AttachmentsController < ApplicationController
  respond_to :json
  
  def create
    @attachment = Attachment.new(params[:attachment])
    if @attachment.save
      render :json => @attachment
    else
      render :json => @attachment.errors.full_messages
    end
  end
end
