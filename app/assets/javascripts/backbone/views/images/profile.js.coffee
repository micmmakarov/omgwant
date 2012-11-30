class Omgwant.Views.Profile extends Backbone.View
  #template: JST["backbone/templates/images/index"]

  initialize: ->
    @collection.on('reset', @render, this)

  addOne: (image) =>
    view = new Omgwant.Views.Image(model: image)
    $("#images-table").append(view.render().el)

  render: ->
    @$el.html HandlebarsTemplates['profile']()
    @collection.each(@addOne)
    this



