class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :user

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
