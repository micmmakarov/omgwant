class Omgwant.Views.Like extends Backbone.View
  events:
    'click': 'like'
  initialize: ->
    @model.on 'change', @render, @
  like: (event)->
    event.preventDefault()
    event.stopImmediatePropagation()
    @model.save()
  render: ->
    console.log('render', JSON.stringify(@model.toJSON()))
    @$el.html HandlebarsTemplates['like'](@model.toJSON())
    @