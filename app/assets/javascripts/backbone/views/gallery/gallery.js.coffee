class Omgwant.Views.Gallery extends Backbone.View

  initialize: ->
    @collection = new Omgwant.Collections.Images()
    @collection.on 'reset', @render, @
    @collection.on 'change', @render, @
    @collection.on 'update', @render, @
    @collection.fetch()
    $(window).scroll =>
      if $(window).scrollTop() + $(window).height() is $(document).height()
        @scroll()

  events:
    'scroll': 'scroll'

  scroll: _.debounce(->
    @collection.scroll()
  , 1000)

  addOne: (image) ->
    view = new Omgwant.Views.FeedImage(model: image)
    ($ "#images-table").append view.render().el
    
  render: ->
    window.a = @collection

    @$el.html HandlebarsTemplates['gallery']({})
    @collection.each(@addOne, @)
    @