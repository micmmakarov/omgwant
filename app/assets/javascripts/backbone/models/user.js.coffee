class Omgwant.Models.User extends Backbone.Model
  intialize: ->
    posted_images = Omgwant.Collections.FeedImages({})

  url:-> "/api/users/#{@id}"

