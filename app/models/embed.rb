class Embed < ActiveRecord::Base
  attr_accessible :image_id, :code

  belongs_to :image

  before_save :generate_code

  def generate_code
    self.code = (0...12).map{65.+(rand(26)).chr}.join
  end

  def url
    "embed/#{self.code}"
  end

end
