class Omgwant.Views.Like extends Backbone.View
  tagName: 'span'
  className: 'like-wrapper'
  
  events:
    'click': 'like'

  initialize: ->
    @model.on 'change', @render, @

  like: (event)->
    event.preventDefault()
    event.stopImmediatePropagation()
    @model.save()

  render: ->
    @$el.html HandlebarsTemplates['like'](@model.toJSON())
    @