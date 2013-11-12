class BookingsController < ApplicationController
  # before_filter :require_pad_owner!, :only => [:approve, :deny]
  
  def new
    @pad = Pad.find(params[:pad_id])
    @booking = Booking.new

    render :new
  end

  def create
    @booking = Booking.new(start_date: params[:check_in], 
                           end_date: params[:check_out], 
                           num_guests: params[:num_guests], 
                           pad_id: params[:pad_id], 
                           booker_id: current_user.id)

    if @booking.save
      render :json => @booking
      # redirect_to root_url
    else
      render :json => @booking.errors.full_messages, :status => :unprocessable_entity
      # flash[:errors] = @booking.errors.full_messages
      # redirect_to root_url
    end
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  #   render :edit
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   raise "you can't edit an unexisting booking!" unless @booking.persisted?
  #   if @booking.update_attributes(params[:booking])
  #     redirect_to cat_url(@booking.cat)
  #   else
  #     render :edit
  #   end
  # end

  def approve
    @booking = Booking.find(params[:id])
    @booking.approve!
    redirect_to root_url
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.deny!
    redirect_to root_url
  end  
end