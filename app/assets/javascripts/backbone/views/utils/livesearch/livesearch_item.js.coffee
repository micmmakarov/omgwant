class Omgwant.Views.LiveSearchItem extends Backbone.View

  initialize: ->
    @model.on 'change', @render, @
        
  render: ->
    @$el.html HandlebarsTemplates['livesearch_item'] @model.toJSON()  