class Omgwant.Views.ImageModal extends Backbone.View
  
  initialize: (options) ->
    @model = options.model
    @render()
  
  events: ->
    
  render: ->
    window.model = @model
    @$el.html HandlebarsTemplates['show_image'](@model.toJSON())
    @    