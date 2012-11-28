class Omgwant.Views.Image extends Backbone.View
  events:
    'click .fuck': 'fuck'

  initialize: ->
    @model.on('change', @render, this)

  fuck: (e) ->
    e.preventDefault()
    @model.fuck()
    @model.change()

  render: ->
    @$el.html HandlebarsTemplates['image'](@model.toJSON())
    this