class Omgwant.Views.ShowImage extends Backbone.View

  className: 'modal-content'
  
  initialize: (options) ->
    @model.on 'change', @render, @
    @model = options.model
    $(document).bind 'keydown', @closeOnEsc # bind listener for key input

  events: 
    'click .close-modal': 'close'
    'click .like': 'like'

  like: (event) ->
    alert "Please sign in to like photos" if typeof current_user is 'undefined'
    return if typeof current_user is 'undefined'
    @model.like()
    false


  close: (e) ->
    e.stopPropagation()
    Omgwant.router.previous()
    $('.overlay').fadeOut 'fast'
    $('body').css('overflow','visible')
    @unbind()
    @remove()

  closeOnEsc: (e) =>
    if e.keyCode is 27
      @close(e)
    
  render: ->
    @$el.html HandlebarsTemplates['images/show_image'](@model.toJSON())
    
    @ProductsView = new Omgwant.Views.ShowImageProducts
      el:@$el.find '.product-list'
      collection:@model.products
    @CommentsView = new Omgwant.Views.Comments
      el:@$el.find '.comment-list'
      collection:@model.comments

    @