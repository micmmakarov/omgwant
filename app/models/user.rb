class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name

  has_many :images

  def refresh_images(access_token)

    client = Instagram.client(:access_token => access_token)
    data = client.user_recent_media

    data.each do |i|
      image = Image.find_or_create_by_url(i.images.standard_resolution.url)
      image.location_name = i.location.name if i.location.name.present? if i.location.present?
      image.title = i.caption.text if i.caption.text.present? if i.caption.present?
      #image.created_time = DateTime.parse(i.caption.created_time)
      image.low_url = i.images.low_resolution.url
      image.thumb = i.images.thumbnail.url
      image.user_id = self.id
      image.save!

    end

  end

end
