class Omgwant.Routers.main extends Backbone.Router

  routes:
    '': 'index'
    'users/:user' : 'profile'
    'dashboard' : 'dashboard'


  initialize: ->
    $("html").on "click", ".link", (event) ->
      event.preventDefault()
      Omgwant.router.navigate @getAttribute('href'), {trigger:true}

  dashboard: ->
    return if current_user.email.blank?
    @view = new Omgwant.Views.Dashboard({el:"#main-content"})

  index: ->
    @view = new Omgwant.Views.Gallery({el:"#main-content"})
  profile: (user) ->
    @view = new Omgwant.Views.Profile({el:"#main-content", user_id:user})