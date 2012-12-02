class Omgwant.Models.User extends Backbone.Model
  intialize: ->
  url:-> "/api/users/#{@id}"