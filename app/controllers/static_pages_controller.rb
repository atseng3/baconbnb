class StaticPagesController < ApplicationController
  def index
    render :index
  end
  
  def root
    render :root
  end
end
