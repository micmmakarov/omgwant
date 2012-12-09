class Omgwant.Views.ShowImage extends Backbone.View

  className: 'modal-content'
  
  initialize: (options) ->
    @model.on 'change', @render, @
    @model = options.model

  events: 
    'click .close-modal': 'close'
    
  close: (e) ->
    e.stopPropagation()
    $('.overlay').fadeOut 'fast'
    $('body').css('overflow','visible')
    @unbind()
    @remove()
    Omgwant.router.previous()

  render: ->
    window.model = @model
    @$el.html HandlebarsTemplates['show_image'](@model.toJSON())
    @    