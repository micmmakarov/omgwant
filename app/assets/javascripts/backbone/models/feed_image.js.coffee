class Omgwant.Models.FeedImage extends Backbone.Model
  initialize: ->

  like: ->
    $.ajax
      type: "POST"
      url: "/api/like/#{@id}"
      success: (data) =>
        @set('like_action', data.like_action)
        @set('likes', data.likes)