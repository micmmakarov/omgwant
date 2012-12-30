class Omgwant.Views.ShowImageProducts extends Backbone.View

  initialize: (options) ->
    @collection = options.collection
    @render()

  tagName: 'li'

  events: ->

  render: ->
    @$el.html HandlebarsTemplates['products/show_image_product'](@collection.toJSON())
    @