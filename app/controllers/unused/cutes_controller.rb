class CutesController < ApplicationController

  before_filter :authenticate_user!

  def cute
    @image = Image.find(params[:id])

      if @image.cutes.where(:user_id => current_user.id).empty?
        Cute.create!(:user_id => current_user.id, :image_id => @image.id)
      else
        Cute.where(:user_id => current_user.id, :image_id => @image.id).first.destroy
      end

  end
end
