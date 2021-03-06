class Api::ImagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :json

  def index
    Image.current_user = current_user if user_signed_in?
    page = params[:page]
    category_name = params[:category]

    if category_name.blank?
      images = Image.where(:published => true).all(:limit => 12, :offset => page, :order => "published_at DESC")
    else
      category = Category.find_by_name(category_name)
      category_id = category.id
      images = Image.where(:published => true, :category_id => category_id).all(:limit => 12, :offset => page, :order => "published_at DESC")
    end

      Thread.current[:user] = current_user
    render json: images.to_json(:methods => api_methods, :include => api_includes )
  end

  def show
    Image.current_user = current_user if user_signed_in?
    image = Image.find(params[:id])
    render json: image.to_json(:methods => api_methods, :include => api_includes) if image.published
  end

  def create
    @image = Image.create(params[:image])
    @image.user = current_user
    render json: @image.to_json(:methods => api_methods, :include => api_includes )
  end

  def update
    @image = Image.find(params[:id])
    if params[:category]
      category_id = Category.find_by_name(params[:category]).id
      params[:category_id] = category_id
    end
    if @image.published =! params[:published] && @image.published == true
      current_user.images_number -= 1
      current_user.save!
    end
    if @image.published =! params[:published] && @image.published == false
      current_user.images_number += 1
      current_user.save!
    end
    @image.published = params[:published]
    if @image.published
      @image.published_at = DateTime.now
    end
    @image.category_id = params[:category_id]
    @image.save! if @image.user = current_user
    render json: @image.to_json(:methods => api_methods, :include => api_includes )
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy if @image.user = current_user
    render json: @image
  end

  def like
    @image = Image.find(params[:id])
    if @image.cutes.where(:user_id => current_user.id).empty?
      Cute.create!(:user_id => current_user.id, :image_id => @image.id)
    else
      Cute.where(:user_id => current_user.id, :image_id => @image.id).first.destroy
    end

    render json: {likes: @image.likes, like_action:@image.like_action} if @image.published
  end





end