class Omgwant.Views.Gallery extends Backbone.View
  initialize: ->
    @collection.on 'reset', @render, @
  addOne: (image) ->
    view = new Omgwant.Views.FeedImage(model: image)
    ($ "#images-table").append view.render().el
  render: ->
    @$el.html HandlebarsTemplates['gallery']({})
    @collection.each(@addOne, @)
    @