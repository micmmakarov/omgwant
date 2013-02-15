class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user
  helper_method :api_methods, :like_methods, :api_includes

  def api_methods
    [:title, :low_url, :url, :likes, :computed_title, :like_action, :user_info, :products, :category_name]
  end

  def api_includes
    {:comments => {:include => {:user => {:only => [:name, :image_url]}}}}
  end

  def like_methods
    [:likes, :like_action]
  end


  def user
    if session[:access_token].present?
      client = Instagram.client(:access_token => session[:access_token])
      @data = client.user_recent_media
      @user = {}

      @user[:nickname] = @data[0].caption.from.username
      @user[:name] = @data[0].caption.from.full_name
      @user[:image_url] = @data[0].caption.from.profile_picture
    else
      @user[:nickname] = "no user"
      @user[:name] = "no user"
      @user[:image_url] = ""

    end

    @user
  end

end
