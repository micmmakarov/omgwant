class Omgwant.Views.Image extends Backbone.View

  className: 'gallery-image'
  
  events:
    'click .like': 'like'

  initialize: ->
    @model.on('change', @render, this)

  like: (e) ->
    e.preventDefault()
    @model.like()

  render: ->
    @$el.html HandlebarsTemplates['image'](@model.toJSON())
    this