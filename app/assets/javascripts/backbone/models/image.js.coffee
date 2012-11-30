class Omgwant.Models.Image extends Backbone.Model
  #paramRoot: 'image'

  like: ->
    $.ajax
      type: "POST"
      url: "api/cute/#{@id}"
      success: (data) =>
        @set('likes', data.likes)

  like_action_label: ->
    like_action = @.get('like_action')
    label = "Like" if like_action == true
    label = "Unlike" if like_action == false
    console.log like_action
    label
  
  to_JSON1: =>
    j = @.toJSON()
    j.like_action_label = @.like_action_label()
    j
