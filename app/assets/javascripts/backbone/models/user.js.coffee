class Omgwant.Models.User extends Backbone.Model
  intialize: ->
    posted_images = Omgwant.Collections.FeedImages({})
    posted_images.url = '/api/images'

  url:-> "/api/users/#{@id}"

