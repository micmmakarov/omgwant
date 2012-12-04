class Api::UsersController < ApplicationController
  def show
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    render json: user.to_json
  end

  def user_likes
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    images = user.liked_images
    render json: images
  end

  def user_published
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    images = user.published_images
    render json: images
  end

end