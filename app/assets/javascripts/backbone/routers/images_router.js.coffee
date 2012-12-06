class Omgwant.Routers.main extends Backbone.Router

  routes:
    ''            : 'index'
    'users/:user' : 'profile'
    'dashboard'   : 'dashboard'
    'about'       : 'about'
    'help'        : 'help'

  initialize: ->
    $("html").on "click", ".link", (event) ->
      Omgwant.router.navigate @getAttribute('href'), {trigger:true}

  profile: (user) ->
    @view = new Omgwant.Views.Profile({el:"#main-content", user_id:user})

  about: ->
    @view = new Omgwant.Views.StaticPage({el:"#main-content", pageName: 'about'})

  help: ->
    @view = new Omgwant.Views.StaticPage({el:"#main-content", pageName: 'help'})

  dashboard: ->
    return if typeof current_user is 'undefined'
    @view = new Omgwant.Views.Dashboard({el:"#main-content"})

  index: ->
    @view = new Omgwant.Views.Gallery({el:"#main-content"})

