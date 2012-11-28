class Api::ImagesController < ApplicationController
  respond_to :json
  def index
    images = Image.where(:published => true)
    render json: images.to_json(:methods => [:title, :low_url, :url, :cutes, :user_name])
  end

  def show
    image = Image.find(params[:id])
    render json: image.to_json(:methods => [:title, :low_url, :url, :cutes, :user_name]) if image.published
  end
end