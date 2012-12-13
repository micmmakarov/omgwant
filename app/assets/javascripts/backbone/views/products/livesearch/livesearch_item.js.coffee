class Omgwant.Views.LiveSearchItem extends Backbone.View
  tagName: "li"

  initialize: (options) ->
    _.bindAll @
    @render()
    @image = options.image || {}
    @products = @image.products

  events:
    'click': 'add_product'

  add_product: ->
    #alert "product added #{@model.get 'name'} to #{@image.get 'title'}"
    @model.unset 'id'
    @model.set 'image_id', @image.id
    @products.create(@model.toJSON())
    @kill()
    
  kill: ->
    @unbind()
    @remove()
    
  render: ->
    @$el.html HandlebarsTemplates['products/livesearch_item'] @model.toJSON()
    @
