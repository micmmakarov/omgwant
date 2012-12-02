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
    
    @view = new Omgwant.Views.Profile({el:"#main-content"})
    