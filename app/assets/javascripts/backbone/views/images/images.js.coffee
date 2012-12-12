class Omgwant.Views.Images extends Backbone.View

  initialize: ->
    @collection.on 'reset', @render, @

  addOne: (image) ->
    view = new Omgwant.Views.FeedImage(model: image)
    ($ "#images-table").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['images/gallery']({})
    @collection.each(@addOne, @)
    @