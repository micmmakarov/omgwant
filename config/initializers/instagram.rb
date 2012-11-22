require "instagram"

Instagram.configure do |config|
  config.client_id = "87f19d0483564d8d8189296cdfbed3fa"
  config.client_secret = "ffe308c048ad4f849a3f3d71df708280"
end

CALLBACK_URL = "http://localhost:3000/callback"