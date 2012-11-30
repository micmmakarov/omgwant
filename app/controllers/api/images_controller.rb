class Api::ImagesController < ApplicationController

  before_filter :authenticate_user!, :only => :cute
  respond_to :json

  def index
    Image.current_user = current_user if user_signed_in?
    images = Image.where(:published => true)
    Thread.current[:user] = current_user
    render json: images.to_json(:methods => [:title, :low_url, :url, :likes, :user_name, :computed_title, :like_action])
  end

  def show
    Image.current_user = current_user if user_signed_in?
    image = Image.find(params[:id])
    render json: image.to_json(:methods => [:title, :low_url, :url, :likes, :user_name, :computed_title, :like_action]) if image.published
  end


  def cute
    @image = Image.find(params[:id])
    if @image.cutes.where(:user_id => current_user.id).empty?
      Cute.create!(:user_id => current_user.id, :image_id => @image.id)
    else
      Cute.where(:user_id => current_user.id, :image_id => @image.id).first.destroy
    end

    render json: @image.to_json(:methods => [:title, :low_url, :url, :likes, :user_name, :computed_title]) if @image.published
  end





end