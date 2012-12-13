class Omgwant.Models.FeedImage extends Backbone.Model

  urlRoot: "/api/images"
    
  initialize: ->
    @products = new Omgwant.Collections.Products()
    @products.url = "/api/images/#{@id}/products"

  like: ->
    $.ajax
      type: "POST"
      url: "/api/like/#{@id}"
      success: (data) =>
        @set('like_action', data.like_action)
        @set('likes', data.likes)

