class Omgwant.Views.Image extends Backbone.View

  render: ->
    @$el.html HandlebarsTemplates['image'](@model.toJSON())
    this