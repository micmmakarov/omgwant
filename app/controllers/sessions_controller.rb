class SessionsController < ApplicationController

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    client = Instagram.client(:access_token => session[:access_token])
    u = client.user


    if (user = User.find_by_instagram_id(u.id)).present?
      sign_in(user)
      redirect_to :controller => :home, :action => :dashboard
    else
      user = User.create(:email => "fucking_user@fuck.com", :name => u.username)
      pwd = Devise.friendly_token.first(10)
      user.instagram_id = u.id
      user.full_name = u.full_name
      user.password = user.password_confirmation = pwd
      user.image_url = u.profile_picture
      user.save!
      sign_in(user)
      redirect_to :controller => :home, :action => :dashboard

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


end
