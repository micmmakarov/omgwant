class Omgwant.Views.LiveSearchItem extends Backbone.View
  tagName: "li"

  initialize: (options) ->
    _.bindAll @
    @render()
    @image = options.image || {}
    @products = @image.products
    @collection = options.collection

  events:
    'click': 'add_product'

  add_product: ->
    #alert "product added #{@model.get 'name'} to #{@image.get 'title'}"
    @$el.parent().parent().find("input").val('')
    @model.unset 'id'
    @model.set 'image_id', @image.id
    @products.create(@model.toJSON())
    @collection.reset()

    
  kill: ->
    @unbind()
    @remove()
    
  render: ->
    @$el.html HandlebarsTemplates['products/livesearch_item'] @model.toJSON()
    @
