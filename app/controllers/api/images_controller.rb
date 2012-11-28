class Api::ImagesController < ApplicationController
  respond_to :json
  def index
    images = Image.where(:published => true)
    render json: images.to_json(:methods => [:title, :low_url, :url, :cutes])
  end
end