class Omgwant.Routers.main extends Backbone.Router

  routes:
    '': 'index'
    ':user/likes': 'likes'

  initialize: ->
    @images = new Omgwant.Collections.Images()
    @images.fetch()

  index: ->
    @view = new Omgwant.Views.Images({el:"#images",collection: @images})
    #$("#images").html(@view.render().el)

  likes: (user) ->
    @likes = new Omgwant.Collections.Likes()
    @likes.set('fuck',5)
    @likes.fucking()
    # @likes.updateByUser(user)
    @view = new Omgwant.Views.Likes({el:"#images", collection: @likes})
    