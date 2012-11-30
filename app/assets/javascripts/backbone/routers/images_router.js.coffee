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
    @user = new Omgwant.Models.User(id:user)
    @user.images.fetch()
    #@user.fetch(user)
    @view = new Omgwant.Views.Images({el:"#images",collection: @user.images})
    #@view = new Omgwant.Views.Likes({el:"#images", collection: @likes})
    