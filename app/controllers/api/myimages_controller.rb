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

  def create
    @image = Image.create(params[:image])
    render json: @image
  end

  def update
    @image = Image.find(params[:id])
    #binding.pry
    @image.published = params[:myimage][:published]
    @image.save! #if @image.user = current_user
    #@image = @image.update_attributes(params[:myimage]) if @image.user = current_user
    render json: @image
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy if @image.user = current_user
    render json: @image
  end

end