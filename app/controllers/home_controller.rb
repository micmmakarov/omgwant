require "instagram"

class HomeController < ApplicationController

  def index
  end


  def about
  end

  def auth
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to "/dashboard"
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    @data = client.user_recent_media
    binding.pry
  end

  def dashboard
    client = Instagram.client(:access_token => session[:access_token])
    @data = client.user_recent_media

    @data.each do |i|
      image = Image.find_or_create_by_url(i.images.standard_resolution.url)
        image.location_name = i.location.name if i.location.name.present? if i.location.present?
        image.title = i.caption.text if i.caption.text.present? if i.caption.present?
            #image.created_time = DateTime.parse(i.caption.created_time)
        image.low_url = i.images.low_resolution.url
        image.thumb = i.images.thumbnail.url
      image.save!

    end

    @images = Image.all

    @user = {}
    @user[:nickname] = @data[0].caption.from.username
    @user[:name] = @data[0].caption.from.full_name
    @user[:image_url] = @data[0].caption.from.profile_picture

  end


end
