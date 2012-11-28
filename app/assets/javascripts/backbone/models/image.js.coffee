class Omgwant.Models.Image extends Backbone.Model
  #paramRoot: 'image'

  like: ->
    $.post "api/cute/#{@id}.json"

