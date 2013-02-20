class Omgwant.Views.LiveSearch extends Backbone.View
  
  initialize: (options) ->
    _.bindAll @, 'flashBefore', 'flashDone'
    @collection = new Omgwant.Collections.Products()
    @collection.on 'add', @addItem, @
    @image = options.image || {}
    $('.bs-modal-content').html HandlebarsTemplates['products/product_form'] {}
    $('html').on 'click', @hideMenu
    @render()

  events:
    'keyup :input': 'search'
    'click .add-custom-product': 'addCustomProduct'

  addItem: (model) ->
    @$el.find('.add-custom-product').removeClass 'hide' # show add link
    itemView = new Omgwant.Views.LiveSearchItem(model: model, image:@image, collection:@collection)
    @$el.find('.livesearch-items').append itemView.el
    @collection.on 'reset', @cleanUp, itemView

  cleanUp: (collection) ->
    # @ - is a view passed on trigger
    @kill()

  flashBefore: ->
    Omgwant.Messages.trigger 'loading:show', "Looking for products..."

  flashDone: ->
    Omgwant.Messages.trigger 'loading:hide'
  
  search: _.debounce (event) ->
    # if user cleared up the input - do not fetch anything
    # just clean up the models; be ready for new search
    @collection.reset()
    if not /\w+/.test event.target.value
      @$el.find('.add-custom-product').addClass 'hide' # hide add link
      return

    @collection.fetch
      add: true
      beforeSend: @flashBefore
      data: 
        search: event.target.value
      dataType:'jsonp'
      success:
        @flashDone
  , 300

  addCustomProduct: ->
    console.log "Add product"
    $('#save-product').on 'click', =>
      @saveProduct()
    @hideMenu()
    # TODO
    # $('#inputProductTitle').focus()

  saveProduct: ->
    name = $('#inputProductTitle').val()
    url = $('#inputProductURL').val()
    price = $('#inputProductPrice').val()
    image_id = @image.get 'id'

    newProduct = @image.products.create
      name: name
      url: url
      price: price
      image_id: image_id
    @collection.reset()
    $('#custom-product-modal').modal 'hide'

  hideMenu: =>
    @$el.find('.livesearch-items li:not(.add-custom-product)').remove()
    @$el.find('.add-custom-product').addClass 'hide'

  render: ->
    @$el.html HandlebarsTemplates['products/livesearch'] {}
    @