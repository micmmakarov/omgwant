class Omgwant.Routers.main extends Backbone.Router

  routes:
    '': 'index'
    '/': 'index'
    ':user/likes': 'likes'
    ':user/likes/': 'likes'

  initialize: ->
    
  index: ->
    @view = new Omgwant.Views.Gallery({el:"#main-content"})

  likes: (user) ->
    @user = new Omgwant.Models.User(id:user)
    @user.images.fetch()
    @view = new Omgwant.Views.Profile({el:"#main-content",collection: @user.images})
    