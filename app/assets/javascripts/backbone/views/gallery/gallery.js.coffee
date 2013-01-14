class Omgwant.Views.Gallery extends Backbone.View

  initialize: (options) ->
    @collection = new Omgwant.Collections.Images()
    if options.category
      @category = options.category
      @url =  "/api/categories/#{@category}/images"
    else
      @category = ""
      @url =  @collection.url
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @
    @collection.fetch
      url: @url
    $(window).scroll =>
      if $(window).scrollTop() + $(window).height() is $(document).height()
        @scroll()
    @$el.html HandlebarsTemplates['images/gallery']({})
    if typeof current_user is 'undefined'
      @$el.parents('.page-wrapper').find('.intro-wrapper').html HandlebarsTemplates['static/intro']({})

  events:
    'scroll': 'scroll'

  scroll: _.debounce(->
    @collection.scroll(@url)
  , 500)

  addOne: (image) ->
    view = new Omgwant.Views.FeedImage(model: image)
    ($ "#images-table").append view.render().el
    
  render: ->
    ($ "#images-table").html("")
    @collection.each(@addOne, @)
    @

