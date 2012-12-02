class Omgwant.Views.Gallery extends Backbone.View
  initialize: ->
    @collection = new Omgwant.Collections.Images({})
    @collection.on 'reset', @render, @
    @collection.fetch()
  addOne: (image) ->
    console.log(image.toJSON())
    view = new Omgwant.Views.Image(model: image)
    $("#images-table").append(view.render().el)
  render: ->
    @$el.html HandlebarsTemplates['gallery']({})
    @collection.each(@addOne, @)
    @