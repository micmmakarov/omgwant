class Omgwant.Views.Products extends Backbone.View

  initialize: (options) ->
    @collection = options.collection
    @collection.on 'reset', @render, @
    @collection.on 'remove', @render, @
    @collection.on 'add', @render, @
    @render()

  #events:

  addOne: (image) ->
   view = new Omgwant.Views.Product(model: image)
   @$el.find(".image-product-list").append  view.render().el

  render: ->
    @$el.html HandlebarsTemplates['products/products'](@collection.toJSON())
    @collection.each(@addOne, @)
    @
