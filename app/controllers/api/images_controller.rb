class Api::ImagesController < ApplicationController

  before_filter :authenticate_user!, :only => :cute
  respond_to :json

  def index
    images = Image.where(:published => true)
    render json: images.to_json(:methods => [:title, :low_url, :url, :cutes, :user_name])
  end

  def show
    image = Image.find(params[:id])
    render json: image.to_json(:methods => [:title, :low_url, :url, :cutes, :user_name]) if image.published
  end


  def cute
    @image = Image.find(params[:id])

    if @image.cutes.where(:user_id => current_user.id).empty?
      Cute.create!(:user_id => current_user.id, :image_id => @image.id)
    else
      Cute.where(:user_id => current_user.id, :image_id => @image.id).first.destroy
    end

  end

end