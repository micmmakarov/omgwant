class Image < ActiveRecord::Base
  attr_accessible :description, :title, :price
  include ActionView::Helpers::TextHelper
  before_save :generate_code

  def generate_code
    self.code = (0...12).map{65.+(rand(26)).chr}.join if self.code.blank?
  end

  def embed_link
    "embed/#{self.code}"
  end

  def likes
     1#cutes.length
  end

  def user_name
    self.user.full_name.blank? ? self.user.name : self.user.full_name
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

  has_many :products, :through => :images_products
  has_many :images_products
  has_one :embed

  belongs_to :user

  has_many :cutes

end
