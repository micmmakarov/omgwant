class Omgwant.Views.LiveSearchItem extends Backbone.View
  tagName: "li"

  initialize: ->
    _.bindAll @
    @render()
    
  kill: ->
    @unbind()
    @remove()
    
  render: ->
    @$el.html HandlebarsTemplates['livesearch_item'] @model.toJSON()
    @
