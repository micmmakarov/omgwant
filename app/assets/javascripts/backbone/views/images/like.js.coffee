class Omgwant.Views.Like extends Backbone.View
  tagName: 'span'
  className: 'like-wrapper'
  
  initialize: ->
    @model.on 'change', @render, @

  render: ->
    @$el.html HandlebarsTemplates['like'](@model.toJSON())
    @