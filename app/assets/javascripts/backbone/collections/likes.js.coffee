class Omgwant.Collections.Likes extends Backbone.Collection
  model: Omgwant.Models.Image
  url: "/api/#{@name}/likes"
  
  initialize: ->

  updateByUser: (user) ->
    $.ajax
      type: "GET"
      # url: "/api/#{user}/likes"
      url: "/api/images"
      success: (data) =>
        console.log data
        # @set('likes', data.likes)
  
  fucking: ->
    alert @fuck
      