class Omgwant.Views.Images extends Backbone.View
  initialize: ->
    return

  addOne: (image) =>
    view = new Omgwant.Views.Image(model: image)
    ($ "#images-table").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['images']()
    @collection.each @addOne
    @



