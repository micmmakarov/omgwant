class Omgwant.Views.Gallery extends Backbone.View
  initialize: ->
    @collection = new Omgwant.Collections.FeedImages()
    @collection.on 'reset', @render, @
    @collection.fetch()

  addOne: (image) ->
    view = new Omgwant.Views.FeedImage(model: image)
    ($ "#images-table").append view.render().el
  render: ->
    @$el.html HandlebarsTemplates['gallery']({})
    @collection.each(@addOne, @)
    @