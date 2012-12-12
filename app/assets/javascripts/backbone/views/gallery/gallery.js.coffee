class Omgwant.Views.Gallery extends Backbone.View

  initialize: ->
    @collection = new Omgwant.Collections.Images()
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @
    @collection.fetch()
    $(window).scroll =>
      if $(window).scrollTop() + $(window).height() is $(document).height()
        @scroll()

  events:
    'scroll': 'scroll'

  scroll: _.debounce(->
    @collection.scroll()
  , 500)

  addOne: (image) ->
    view = new Omgwant.Views.FeedImage(model: image)
    ($ "#images-table").append view.render().el
    
  render: ->
    @$el.html HandlebarsTemplates['images/gallery']({})
    @collection.each(@addOne, @)
    @