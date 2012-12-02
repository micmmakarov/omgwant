class Omgwant.Models.Like extends Backbone.Model
  initialize: ->
  url: ->
    "/api/like/#{@id}"