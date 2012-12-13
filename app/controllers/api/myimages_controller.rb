class Api::MyimagesController < ApplicationController

  before_filter :user_signed_in?

  def index
    @images = current_user.images.order('created_at DESC')
    render json: @images.to_json(:methods => api_methods)
  end

  def show
    @image = Image.find(params[:id])

    render json: @image.to_json(:methods => api_methods) if @image.user = current_user
  end



end