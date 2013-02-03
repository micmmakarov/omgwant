class Api::UsersController < ApplicationController

  before_filter :user_signed_in?, :only => [:follows]


  def show
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    User.is_following = current_user.following?(user) if user_signed_in?
    render json: user.to_json(:methods => [:is_following])
  end

  def user_likes
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    images = user.liked_images
    render json: images.to_json(:methods => api_methods)
  end

  def user_published
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    images = user.published_images
    render json: images.to_json(:methods => api_methods)
  end

  def follow
    user = User.find(params[:id])
    User.is_following = current_user.following?(user)
    if current_user.following?(user)
      current_user.unfollow!(user)
    else
      current_user.follow!(user)
    end
    render json: user.to_json(:methods => [:is_following])
  end

  def feed
    users = current_user.followed_users
    feed = users.map {|u| u.images.order("created_at DESC")}.flatten.sort_by{|e| e[:created_at]}
    render json: feed.to_json(:methods => api_methods)
  end

end