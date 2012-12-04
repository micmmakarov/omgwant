class Omgwant.Models.User extends Backbone.Model
  initialize: ->
    @published_images = new Omgwant.Collections.Images()
    @published_images.url = "/api/users/#{@id}/published"
    @liked_images = new Omgwant.Collections.Images()
    @liked_images.url = "/api/users/#{@id}/likes"

  url:-> "/api/users/#{@id}"

