class AdminController < ApplicationController
  before_filter :authenticate_user!

  def recache
    #Follow
    User.all.each do |u|
      u.followers_number = u.followers.length
      u.following_number = u.followed_users.length
      u.images_number = u.images.where(:published => true).length
      u.save!
    end
    render text:'Recaching complete'
  end




end
