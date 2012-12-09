class Omgwant.Routers.main extends Backbone.Router


  routes:
    ''            : 'index'
    'users/:user' : 'profile'
    'dashboard'   : 'dashboard'
    'about'       : 'about'
    'help'        : 'help'
    'sandbox'     : 'sandbox'
    'photo/:id'   : 'show_image'

  initialize: ->
    @on "all", @storeRoute
    @history = []

    $("html").on "click", ".link", (event) ->
      event.preventDefault()
      if @getAttribute('data-page') == 'home'
        Omgwant.router.navigate @getAttribute(''), {trigger:true}
      else
        Omgwant.router.navigate @getAttribute('href'), {trigger:true}

  profile: (user) ->
    @view = new Omgwant.Views.Profile({el:"#content", user_id:user})

  about: ->
    @view = new Omgwant.Views.StaticPage({el:"#content", pageName: 'about'})

  help: ->
    @view = new Omgwant.Views.StaticPage({el:"#content", pageName: 'help'})

  # dump for temporary markup and experiments
  sandbox: ->
    @view = new Omgwant.Views.StaticPage({el:"#content", pageName: 'sandbox'})

  dashboard: ->
    return unless current_user?
    @view = new Omgwant.Views.Dashboard({el:"#content"})
    
  show_image: (id) ->
    currentImage = Omgwant.currentImage
    if not currentImage?
      currentImage = new Omgwant.Models.FeedImage({id: id})
      currentImage.fetch()
    @view = new Omgwant.Views.ShowImage({model: currentImage})
    $(".modal-holder").html @view.render().el

    $('.overlay').fadeIn 'fast'
    $('body').css 'overflow','hidden'

  index: ->
    @view = new Omgwant.Views.Gallery({el:"#content"})


  storeRoute: ->
    @history.push Backbone.history.fragment

  previous: ->
    if @history.length > 1
      @navigate @history[@history.length-2], false
    else
      @navigate '', true
