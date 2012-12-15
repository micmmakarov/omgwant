class Omgwant.Views.Product extends Backbone.View

  events: ->
    'click .delete': 'delete'

  delete: (e) ->
    e.preventDefault()
    @model.destroy()

  render: ->
    @$el.html HandlebarsTemplates['products/product'](@model.toJSON())
    @