class Api::MyimagesController < ApplicationController

  before_filter :user_signed_in?

  def index
    @images = current_user.images.order('created_at DESC')
    render json: @images
  end

  def show
    @image = Image.find(params[:id])

    render json: @image if @image.user = current_user
  end



end