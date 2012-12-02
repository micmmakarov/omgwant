if ENV['RAILS_ENV'] == 'development'
  FACEBOOK_APP_ID= '306044179500661' # please change!
  FACEBOOK_APP_SECRET= 'd55c4919c1e9ec21099c518e7be75674' # please change!
  FACEBOOK_SITE_URL = 'http://localhost:3000/'
  FACEBOOK_CALLBACK = 'http://localhost:3000/facebook/callback'
end
if ENV['RAILS_ENV'] == 'production'
  FACEBOOK_APP_ID= '306688069433056' # please change!
  FACEBOOK_APP_SECRET= '10260ce7ccc4f6611511c20793a4673e' # please change!
  FACEBOOK_SITE_URL = 'http://omgwant.herokuapp.com/'
  FACEBOOK_CALLBACK = 'http://omgwant.herokuapp.com/facebook/callback'
end