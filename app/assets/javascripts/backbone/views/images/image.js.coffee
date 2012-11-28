class Omgwant.Views.Image extends Backbone.View

  events:
    'click .fuck': 'like'

  initialize: ->
    @model.on('change', @render, this)

  fuck: (e) ->
    e.preventDefault()
    @model.like()
    @model.change()

  render: ->
    @$el.html HandlebarsTemplates['image'](@model.toJSON())
    this