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

  def create
    @image = Image.create(params[:image])
    render json: @image.to_json(:methods => api_methods)
  end

  def update
    @image = Image.find(params[:id])
    @image = Image.update_attributes(params[:id]) if @image.user = current_user
    render json: @image.to_json(:methods => api_methods)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy if @image.user = current_user
    render json: @image.to_json(:methods => api_methods)
  end

end