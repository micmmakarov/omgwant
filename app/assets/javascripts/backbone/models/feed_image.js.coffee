class Omgwant.Models.FeedImage extends Backbone.Model

  urlRoot: "/api/images"
    
  initialize: ->
    products_json = (@get 'products') || []
    @products = new Omgwant.Collections.Products(products_json)
    @products.url = "/api/images/#{@id}/products"
    comments_json = (@get 'comments') || []
    @comments = new Omgwant.Collections.Comments(comments_json)
    @comments.url = "/api/images/#{@id}/comments"

  like: ->
    $.ajax
      type: "POST"
      url: "/api/like/#{@id}"
      success: (data) =>
        @set('like_action', data.like_action)
        @set('likes', data.likes)


