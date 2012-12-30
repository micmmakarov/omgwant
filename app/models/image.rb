class Image < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :description, :title, :price
  include ActionView::Helpers::TextHelper
  before_save :generate_code
  has_many :products
  has_one :embed
  belongs_to :user
  has_many :cutes
  has_one :category

  def generate_code
    self.code = (0...12).map{65.+(rand(26)).chr}.join if self.code.blank?
  end

  def embed_link
    "embed/#{self.code}"
  end

  def likes
     cutes.length
  end

  def user_info
    self.user
  end

  def like_action
    if current_user.present?
      not Cute.where(:user_id => current_user.id, :image_id => id).first.present?
    end
  end

  def user_name
    a_name = self.user.full_name.blank? ? self.user.name : self.user.full_name
    a_name.split(" ")[0]
  end

  def user_id

  end

  def category_name
    category.name
  end


  def computed_title
    if title.present?
      truncate(title, :length => 120)
    elsif location_name.present?
      location_name
    else
      "No title"
    end
  end


end
