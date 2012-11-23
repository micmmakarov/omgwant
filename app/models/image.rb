class Image < ActiveRecord::Base
  attr_accessible :description, :title, :price

  has_many :products, :through => :images_products
  has_many :images_products
  has_one :embed

  belongs_to :user

end
