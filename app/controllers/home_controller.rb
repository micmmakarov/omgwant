require "instagram"

class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :gallery]

  def index
    if user_signed_in?
      #redirect_to :dashboard
    end
  end


  def about
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    @data = client.user_recent_media
  end

  def dashboard
    @images = current_user.images
    @products = Product.all.map { |p| p.title}.to_json
  end

  def gallery
    @images = Image.where(:published => true)
  end


end
