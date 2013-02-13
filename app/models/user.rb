class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  cattr_accessor :is_following
  include ActionView::Helpers::TextHelper
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name

  has_many :images
  has_many :cutes

  has_many :follows, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :follows, source: :followed
  has_many :reverse_follows, foreign_key: "followed_id",
           class_name:  "Follow",
           dependent:   :destroy
  has_many :followers, through: :reverse_follows, source: :follower
  has_many :comments


  def following?(other_user)
    follows.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    follows.create!(followed_id: other_user.id)
    other_user.followers_number += 1
    self.following_number += 1
    other_user.save!
    save!
  end

  def unfollow!(other_user)
    follows.find_by_followed_id(other_user.id).destroy
    other_user.followers_number -= 1
    self.following_number -= 1
    other_user.save!
    save!
  end

  def liked_images
    cutes.order('created_at DESC').map {|c| c.image}.flatten
  end

  def computed_name
    if full_name.present?
      full_name
    else
      name
    end
  end

  def published_images
    images.where(:published => true)
  end

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


  def facebook_post(image)
    api = Koala::Facebook::API.new(self.facebook_token)
    message = "#{image.title} #{image.url}"
    #api.put_connections("me", "feed", :message => message)

    api.put_wall_post(
        "Just posted new thing - #{image.title}",
        :name => image.title,
        :link => "http://omgwant.herokuapp.com/#{image.embed_link}",
        :caption => "#{image.description}",
        # just-in-case note: picture should be a URL, not a File (that's for put_picture)
        :picture => image.low_url
    )


    #api.put_wall_post(image.title, {"url" => "http://startupstory.ru/peter_vesterbacka"})
  end

end
