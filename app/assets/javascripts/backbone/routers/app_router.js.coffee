class Omgwant.Routers.main extends Backbone.Router

  routes:
    ''            : 'index'
    '_'           : 'index'
    'home'        : 'index'
    'feed'        : 'feed'
    'following'   : 'following'
    'users/:user' : 'profile'
    'dashboard'   : 'dashboard'
    'about'       : 'about'
    'faq'         : 'faq'
    'sandbox'     : 'sandbox'
    'photo/:id'   : 'show_image'
    'c/:category' : 'category'

  initialize: ->
    @on "all", @storeRoute

    @history = []
    @messages = new Omgwant.Views.Flash()
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

  faq: ->
    @view = new Omgwant.Views.StaticPage({el:"#content", pageName: 'faq'})

  following: ->
    @view = new Omgwant.Views.Following(el:"#content")

  feed: ->
    @view = new Omgwant.Views.Gallery
      el:"#content"
      feed:true

  # dump page for temporary markup and experiments
  sandbox: ->
    @view = new Omgwant.Views.StaticPage({el:"#content", pageName: 'sandbox'})

  dashboard: ->
    return unless current_user?
    @view = new Omgwant.Views.Dashboard({el:"#content"})
    
  show_image: (id) ->
    currentImage = Omgwant.currentImage
    if not currentImage?
      currentImage = new Omgwant.Models.FeedImage({id: id})
      currentImage.fetch().complete ->
        currentImage.initialize()
        @view = new Omgwant.Views.ShowImage({model: currentImage})
        $(".modal-holder").html @view.render().el
    else
      @view = new Omgwant.Views.ShowImage({model: currentImage})
      $(".modal-holder").html @view.render().el

    $('.overlay').fadeIn 'fast'
    $('body').css 'overflow','hidden'

  index: ->
    @view = new Omgwant.Views.Gallery({el:"#content"})


  category: (category) ->
    @view = new Omgwant.Views.Gallery({el:"#content", category: category})


  storeRoute: ->
    current_url = Backbone.history.fragment
    @history.push current_url
    @highlight_links(current_url)

  storeUrl: (current_url) ->
    @history.push current_url
    @highlight_links(current_url)

  previous: ->
    if @history.length > 1
      current_url = @history[@history.length-2]
      @storeUrl(current_url)
      @navigate current_url, false
    else
      current_url = ''
      @navigate current_url, true
    @highlight_links(current_url)

  highlight_links: (current_url) ->
    if typeof current_user is 'undefined'
      if current_url is '' or current_url[0..4] == 'photo' or current_url is '_'
        $('.page-wrapper .intro-wrapper').html HandlebarsTemplates['static/intro']({})
        $('.page-wrapper .intro-wrapper').slideDown('fast')
      else
        $('.page-wrapper .intro-wrapper').slideUp('fast', ->
        )
    $("a[href!='/#{current_url}']").parent().removeClass('active')
    $("a[href='/#{current_url}']").parent().addClass('active')
    if current_url.substr(0,2) == "c/"
      $("a[data-link='home']").parent().addClass('active')
