class Omgwant.Views.Like extends Backbone.View
  events:
    'click': 'like'
  initialize: ->
    window.like = @
    @render()
    @model.on 'change', @render, @
  like: (event)->
    event.preventDefault()
    event.stopImmediatePropagation()
    console.log @model.get('id'), event.target
    @model.save()
  render: ->
    console.log('render', @model.get('id'), JSON.stringify(@model.toJSON()))
    @$el.html HandlebarsTemplates['like'](@model.toJSON())