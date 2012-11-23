class ImagesProduct < ActiveRecord::Base
  attr_accessible :image_id, :product_id

  belongs_to :image
  belongs_to :product

end
