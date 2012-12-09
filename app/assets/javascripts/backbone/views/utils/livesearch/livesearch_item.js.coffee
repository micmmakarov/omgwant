class Omgwant.Views.LiveSearchItem extends Backbone.View

  tagName: "li"

  initialize: ->
    #@model.on 'reset', @render, @
    @render()

  render: ->
    @$el.html HandlebarsTemplates['livesearch_item'] @model.toJSON()  
