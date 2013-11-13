class BookingsController < ApplicationController
  # before_filter :require_pad_owner!, :only => [:approve, :deny]
  
  def index
    render :index
  end
  
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
    else
      render :json => @booking.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.approve!
    flash[:success] = ["You've just approved a booking request!"]
    redirect_to pad_url(@booking.pad)
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.deny!
    flash[:success] = ["You've just denied a booking request!"]
    redirect_to pad_url(@booking.pad)
  end  
end