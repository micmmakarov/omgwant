class Api::UsersController < ApplicationController

  before_filter :user_signed_in?, :only => [:follows]


  def show
    Image.current_user = current_user if user_signed_in?
    if params[:id].is_number?
      user = User.find(params[:id])
    else
      user = User.find_by_slug(params[:id])
    end
    User.is_following = current_user.following?(user) if user_signed_in?
    render json: user.to_json(:methods => [:is_following])
  end

  def user_likes
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    images = user.liked_images
    render json: images.to_json(:methods => api_methods, :include => api_includes)
  end

  def user_published
    Image.current_user = current_user if user_signed_in?
    user = User.find(params[:id])
    images = user.published_images
    render json: images.to_json(:methods => api_methods, :include => api_includes)
  end

  def follow
    user = User.find(params[:id])
    User.is_following = current_user.following?(user)
    if current_user.following?(user)
      current_user.unfollow!(user)
    else
      current_user.follow!(user)
    end
    User.is_following = current_user.following?(user)
    render json: user.to_json(:methods => [:is_following])
  end

  def feed
    Image.current_user = current_user if user_signed_in?
    users = current_user.followed_users
    #feed = users.map {|u| u.images.order("created_at DESC")}.flatten.sort_by{|e| e[:created_at]}
    published_feed = users.map {|u| u.published_images}.flatten.sort_by{|e| e[:created_at]}.as_json(:methods => api_methods)
    published_feed.length.times do |p|
      published_feed[p][:feed_date] = published_feed[p]["published_at"]
      puts published_feed[p][:feed_date]
    end
    liked_images = users.map { |u| u.cutes.order('created_at DESC').map {|c| image = c.image.as_json(:methods => api_methods); image[:liked] = true; image[:liked_by] = c.user.as_json;image[:liked_at] = c.created_at; image[:feed_date] = c.created_at;image} }
    liked_feed = liked_images.flatten
    the_feed = (liked_feed + published_feed).sort_by{|e| e[:feed_date]}
    render json: the_feed


  end

private
  def is_number?(object)
    true if Float(object) rescue false
  end

end