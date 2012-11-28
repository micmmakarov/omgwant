class Omgwant.Models.Image extends Backbone.Model
  #paramRoot: 'image'

  like: ->
    $.ajax
      type: "POST"
      url: "api/cute/#{@id}"
      success: (data) =>
        @set('likes', data.likes)


