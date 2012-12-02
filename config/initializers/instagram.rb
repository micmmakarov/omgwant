require "instagram"

if ENV['RAILS_ENV'] == 'development'

  Instagram.configure do |config|
    config.client_id = "87f19d0483564d8d8189296cdfbed3fa"
    config.client_secret = "ffe308c048ad4f849a3f3d71df708280"
  end

  CALLBACK_URL = "http://localhost:3000/callback"
end

if ENV['RAILS_ENV'] == 'production'

  Instagram.configure do |config|
    config.client_id = "b7f2d0a628ca44aa846509239102c8ea"
    config.client_secret = "917616e528a84bad92a9056c7d24c3ea"
  end

  CALLBACK_URL = "http://omgwant.herokuapp.com/callback"

end