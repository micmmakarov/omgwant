class Omgwant.Views.LiveSearchItem extends Backbone.View
  tagName: "li"

  initialize: (options) ->
    _.bindAll @
    @render()
    @image = options.image || {}
    @products = @image.products
    @collection = options.collection

  events:
    'click': 'addProduct'

  addProduct: (e) ->
    e.stopPropagation()
    @$el.parent().parent().find("input").val('')
    @model.unset 'id'
    @model.set 'image_id', @image.id
    @products.create(@model.toJSON())
    @$el.parents('ul').find('.add-custom-product').addClass 'hide'
    @collection.reset()

  kill: ->
    @unbind()
    @remove()
    
  render: ->
    @$el.html HandlebarsTemplates['products/livesearch_item'] @model.toJSON()
    @
