class Omgwant.Views.LikedImage extends Backbone.View
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  render: ->
    @$el.html HandlebarsTemplates['liked_image'] @model.toJSON()
    @