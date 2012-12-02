class Api::UsersController < ApplicationController
  def show
    Image.current_user = current_user if user_signed_in?
    @user = User.find(params[:id])
    images = user.liked_images
    #render json: {image_collection: images.to_json(:methods => api_methods), user_info: user}
    render json: @user.to_json(:methods => :liked_images)
  end
end