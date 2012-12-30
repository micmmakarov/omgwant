class Omgwant.Views.ShowImage extends Backbone.View

  className: 'modal-content'
  
  initialize: (options) ->
    @model.on 'change', @render, @
    @model = options.model
    $(document).bind 'keypress', @closeOnEsc

  events: 
    'click .close-modal': 'close'
    
  close: (e) ->
    e.stopPropagation()
    $('.overlay').fadeOut 'fast'
    $('body').css('overflow','visible')
    @unbind()
    @remove()
    Omgwant.router.previous()
  
  closeOnEsc: (e) =>
    console.log e.keyCode
    if e.keyCode is 27
      @close(e)
    
  render: ->
    @$el.html HandlebarsTemplates['images/show_image'](@model.toJSON())
    
    @ProductsView = new Omgwant.Views.ShowImageProducts
      el:@$el.find '.product-list'
      collection:@model.products
    @