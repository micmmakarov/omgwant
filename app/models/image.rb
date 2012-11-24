class Image < ActiveRecord::Base
  attr_accessible :description, :title, :price

  before_save :generate_code

  def generate_code
    self.code = (0...12).map{65.+(rand(26)).chr}.join if self.code.blank?
  end

  def embed_link
    "embed/#{self.code}"
  end

  has_many :products, :through => :images_products
  has_many :images_products
  has_one :embed

  belongs_to :user

end
