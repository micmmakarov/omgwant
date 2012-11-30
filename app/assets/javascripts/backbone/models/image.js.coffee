class Omgwant.Models.Image extends Backbone.Model
  #paramRoot: 'image'

  like: ->
    $.ajax
      type: "POST"
      url: "api/cute/#{@id}"
      success: (data) =>
        @set('likes', data.likes)


  likable: ->
    "Like" if @.like_action == true
    "Unlike" if @.like_action == false


