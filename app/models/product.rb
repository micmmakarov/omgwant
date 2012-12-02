class Product < ActiveRecord::Base
  attr_accessible :title, :url, :price
  has_many :images, :through => :images_products
  has_many :images_products


end
