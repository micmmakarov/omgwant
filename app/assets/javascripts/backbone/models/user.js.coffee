class Omgwant.Models.User extends Backbone.Model
  intialize: ->
    console.log(@id)
  url:-> "/api/users/#{@id}"