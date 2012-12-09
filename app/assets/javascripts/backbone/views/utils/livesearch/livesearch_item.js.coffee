class Omgwant.Views.LiveSearchItem extends Backbone.View
  tagName: "li"

  initialize: ->
    @render()

  render: ->
    @$el.html HandlebarsTemplates['livesearch_item'] @model.toJSON()  
