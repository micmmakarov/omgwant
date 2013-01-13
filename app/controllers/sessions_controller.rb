class SessionsController < ApplicationController

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    client = Instagram.client(:access_token => session[:access_token])
    u = client.user
    if (user = User.find_by_instagram_id(u.id)).present?
      sign_in(user)
      user.refresh_images(session[:access_token])
      redirect_to :controller => :home, :action => :index
    else
      user = User.create(:email => "#{ (0...10).map{65.+(rand(26)).chr}.join}@email-something.com", :name => u.username)
      pwd = Devise.friendly_token.first(10)
      user.instagram_id = u.id
      user.full_name = u.full_name
      user.password = user.password_confirmation = pwd
      user.image_url = u.profile_picture
      user.save!
      sign_in(user)
      user.refresh_images(session[:access_token])
      redirect_to :controller => :home, :action => :index

    end
    #user.name
    #user.bio
    #user.website
    #user.profile_image
    #user.full_name
    #user.id

    #redirect_to "/dashboard"

  end

  def instagram_auth
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def auth
    session[:oauth] = Koala::Facebook::OAuth.new(FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, FACEBOOK_CALLBACK)
    @facebook_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream, publish_stream")
    puts session.to_s + "<<< session"
  end

  def callbacks
    if params[:provider] == 'facebook'

      if params[:code]
        # acknowledge code and get access token from FB
        session[:access_token] = session[:oauth].get_access_token(params[:code])
      end

      begin

        @api = Koala::Facebook::API.new(session[:access_token])
        fb_me = @api.get_object("me")
        current_user.facebook = fb_me["id"]
        current_user.facebook_token = session[:access_token]
        current_user.save!

        @name = fb_me["name"]

      rescue Exception=>ex
        puts ex.message
      end

    end

    respond_to do |format|
      format.html {   }
    end


  end

end
