class ApiController < ApplicationController

  def post

    image = Image.find(params[:id])
    current_user.facebook_post(image)

  end

end
