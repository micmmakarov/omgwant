class Omgwant.Views.ImageModal extends Backbone.View
  
  initialize: (options) ->
    @model.on 'change', @render, @
    @model = options.model

  events: ->
    
  render: ->
    window.model = @model
    @$el.html HandlebarsTemplates['show_image'](@model.toJSON())
    @    