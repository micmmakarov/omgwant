class Product < ActiveRecord::Base
  attr_accessible :title, :url, :price, :image_id, :name, :ssid, :retailer, :description, :brandname, :brandid, :brandurl, :low_url, :big_url, :thumb_url
  belongs_to :image

end
