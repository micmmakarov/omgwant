class Omgwant.Models.User extends Backbone.Model
  model: Omgwant.Models.Image
  url: => 'users'
    #"/api/users/#{@id}"
  initialize: =>
    @images = new Omgwant.Collections.Images
    @images.url = "/api/users/#{this.id}"


