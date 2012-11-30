class Omgwant.Routers.main extends Backbone.Router

  routes:
    '': 'index'
    ':user/likes': 'likes'

  initialize: ->
    @images = new Omgwant.Collections.Images()
    @images.fetch()

  index: ->
    @view = new Omgwant.Views.Gallery({el:"#main-content",collection: @images})

  likes: (user) ->
    @user = new Omgwant.Models.User(id:user)
    @user.images.fetch()
    @view = new Omgwant.Views.Profile({el:"#main-content",collection: @user.images})
    